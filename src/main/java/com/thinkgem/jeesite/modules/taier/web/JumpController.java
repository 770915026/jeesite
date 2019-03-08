/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taier.entity.AboutUs;
import com.thinkgem.jeesite.modules.taier.entity.AdCertificate;
import com.thinkgem.jeesite.modules.taier.entity.Certificate;
import com.thinkgem.jeesite.modules.taier.entity.CertificateFirstPage;
import com.thinkgem.jeesite.modules.taier.entity.CertificateShow;
import com.thinkgem.jeesite.modules.taier.entity.Contact;
import com.thinkgem.jeesite.modules.taier.entity.CustomerService;
import com.thinkgem.jeesite.modules.taier.entity.FirstPageImg;
import com.thinkgem.jeesite.modules.taier.entity.ModelInfo;
import com.thinkgem.jeesite.modules.taier.entity.News;
import com.thinkgem.jeesite.modules.taier.entity.TlApppreset;
import com.thinkgem.jeesite.modules.taier.entity.TlApps;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyInfo;
import com.thinkgem.jeesite.modules.taier.entity.TlCompanyUnionInfo;
import com.thinkgem.jeesite.modules.taier.entity.TlFactory;
import com.thinkgem.jeesite.modules.taier.entity.TlLink;
import com.thinkgem.jeesite.modules.taier.entity.TlQrcode;
import com.thinkgem.jeesite.modules.taier.service.AboutUsService;
import com.thinkgem.jeesite.modules.taier.service.ActivityService;
import com.thinkgem.jeesite.modules.taier.service.AdCertificateService;
import com.thinkgem.jeesite.modules.taier.service.CertificateFirstPageService;
import com.thinkgem.jeesite.modules.taier.service.CertificateService;
import com.thinkgem.jeesite.modules.taier.service.CertificateShowService;
import com.thinkgem.jeesite.modules.taier.service.ContactService;
import com.thinkgem.jeesite.modules.taier.service.CustomerServiceService;
import com.thinkgem.jeesite.modules.taier.service.FirstPageImgService;
import com.thinkgem.jeesite.modules.taier.service.NewsService;
import com.thinkgem.jeesite.modules.taier.service.TlApppresetService;
import com.thinkgem.jeesite.modules.taier.service.TlAppsService;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyInfoService;
import com.thinkgem.jeesite.modules.taier.service.TlCompanyUnionInfoService;
import com.thinkgem.jeesite.modules.taier.service.TlFactoryService;
import com.thinkgem.jeesite.modules.taier.service.TlLinkService;
import com.thinkgem.jeesite.modules.taier.service.TlQrcodeService;
import com.thinkgem.jeesite.modules.taier.utils.SmsUtil;

/**
 * 用户基本信息Controller
 *
 * @author gy
 * @version 2018-08-20
 */
@Controller
@RequestMapping(value = "/taier/jump")
public class JumpController extends BaseController {

    @Autowired
    private SystemService systemService;

    @Autowired
    private TlAppsService tlAppsService;

    @Autowired
    private TlApppresetService tlApppresetService;

    @Autowired
    private TlFactoryService tlFactoryService;

    @Autowired
    private TlCompanyUnionInfoService tlCompanyUnionInfoService;

    @Autowired
    private AboutUsService aboutUsService;

    @Autowired
    private TlLinkService tlLinkService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private FirstPageImgService firstPageImgService;
    
    @Autowired
    private CustomerServiceService customerServiceService;
    
    @Autowired
	private AdCertificateService adCertificateService;
    @Autowired
    private TlCompanyInfoService tlCompanyInfoService;

    @Autowired
    private TlQrcodeService tlQrcodeService;
    
    @Autowired
	private CertificateService certificateService;
    
    @Autowired
	private CertificateShowService certificateShowService;
    
    @Autowired
	private CertificateFirstPageService certificateFirstPageService;
    
    @Autowired
	private ContactService contactService;

    //跳转到main.jap
    @RequestMapping(value = "main")
    public String register(HttpServletRequest request, HttpServletResponse response, Model model) {
        String type = request.getParameter("type");
        model.addAttribute("type", type);
        //获取底部标签
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "taier/main";
    }


    //跳转到后台登录页
    @RequestMapping(value = "sysLogin")
    public String sysLogin(HttpServletRequest request, HttpServletResponse response, Model model) {
        SystemAuthorizingRealm.Principal principal = UserUtils.getPrincipal();
        if(principal != null){
            UserUtils.getSubject().logout();
        }
        return "modules/sys/login";
    }


    @RequestMapping(value = "getSMSCode")
    public @ResponseBody
    MessageData getSMSCode(@RequestBody ModelInfo modelInfo, HttpServletRequest request, HttpSession httpSession) {
        String code = (int) ((Math.random() * 9 + 1) * 1000) + "";
        String type = modelInfo.getType();
        if ("mpd".equals(type)) {
            httpSession.setAttribute("modifyPasswordSms", code);
        }
        if ("qyzc".equals(type)) {
            httpSession.setAttribute("registerSms", code);
        }

        SmsUtil.sendMsgUtf8(modelInfo.getPhone(), "验证码：" + code);
        return MessageData.success().addMsg("msg", "");
    }

    //分角色
    @RequestMapping(value = "register1")
    public String register1(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        return "taier/register";
    }

    //分账号
    @RequestMapping(value = "register2")
    public String register2(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("user", user);
        String usertype = user.getUserType();
        if ("2".equals(usertype)) {
            return "taier/registeryh";
        } else {
            return "taier/registerqy";
        }

    }

    //企业注册
    @RequestMapping(value = "register3")
    public String register3(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("user", user);
        return "taier/registerqy";
    }

    @RequestMapping(value = "checkCodeRegister")
    public @ResponseBody
    MessageData checkCodeRegister(@RequestBody ModelInfo modelInfo, HttpServletRequest request, HttpSession httpSession) {
        String name = modelInfo.getName();
        User user = systemService.getUserByLoginName(name);
        if(user != null) {
            return MessageData.failed().addMsg("msg", "用户名已存在");
        }
        //图形验证码
        String code = modelInfo.getCode();
        //短信验证码
        String code1 = modelInfo.getCode1();
        String sessioncode = (String) httpSession.getAttribute(ValidateCodeServlet.RGR_CODE);
        String sessioncode1 = (String) httpSession.getAttribute("registerSms");
        if (StringUtils.isNotEmpty(code) && StringUtils.isNotEmpty(sessioncode) && code.toLowerCase().equals(sessioncode.toLowerCase())) {
            if (StringUtils.isNotEmpty(code1) && StringUtils.isNotEmpty(sessioncode1) && code1.toLowerCase().equals(sessioncode1.toLowerCase())) {
//				httpSession.removeAttribute("registerSms");
                return MessageData.success();
            } else {
                return MessageData.failed().addMsg("msg", "短信验证码错误");
            }
        } else {
            return MessageData.failed().addMsg("msg", "图形验证码错误");
        }
    }

    //企业注册
    @RequestMapping(value = "registerSave")
    public @ResponseBody
    MessageData registerSave(@RequestBody User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        user.setPassword(SystemService.entryptPassword(user.getNewPassword()));
        user.setLoginName(user.getName());
        Office company = new Office();
        company.setId("1");
        user.setCompany(company);
        // 保存用户信息
        systemService.saveUser(user);
        // 清除当前用户缓存
        if (user.getLoginName().equals(UserUtils.getUser().getLoginName())) {
            UserUtils.clearCache();
            //UserUtils.getCacheMap().clear();
        }
        return MessageData.success();
    }

    //企业注册
    @RequestMapping(value = "agreementCompany")
    public String agreementCompany(HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = UserUtils.getUser();
        model.addAttribute("user", user);
        return "taier/agreementCompany";
    }

    //忘记密码
    @RequestMapping(value = "forgetPassword")
    public String forgetPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "taier/forgetPassword";
    }

    @RequestMapping(value = "checkCodeForgetPWD")
    public @ResponseBody
    MessageData checkCodeForgetPWD(@RequestBody ModelInfo modelInfo, HttpServletRequest request, HttpSession httpSession) {
        //name
        String name = modelInfo.getName();
        //phone
        String phone = modelInfo.getPhone();
        User user = UserUtils.getByLoginName(name);
        if (user == null) {
            return MessageData.failed().addMsg("msg", "用户名不存在");
        }
        String userphone = user.getPhone();
        if (!phone.equals(userphone)) {
            return MessageData.failed().addMsg("msg", "手机号错误");
        }

        //图形验证码
        String code = modelInfo.getCode();
        //短信验证码
        String code1 = modelInfo.getCode1();
        String sessioncode = (String) httpSession.getAttribute(ValidateCodeServlet.MPW_CODE);
        String sessioncode1 = (String) httpSession.getAttribute("modifyPasswordSms");

        if (StringUtils.isNotEmpty(code) && StringUtils.isNotEmpty(sessioncode) && code.toLowerCase().equals(sessioncode.toLowerCase())) {
            if (StringUtils.isNotEmpty(code1) && StringUtils.isNotEmpty(sessioncode1) && code1.toLowerCase().equals(sessioncode1.toLowerCase())) {
                httpSession.removeAttribute("modifyPasswordSms");
                return MessageData.success();
            } else {
                return MessageData.failed().addMsg("msg", "短信验证码错误");
            }
        } else {
            return MessageData.failed().addMsg("msg", "图形验证码错误");
        }
    }

    @RequestMapping(value = "forgetModeifyPwd")
    public @ResponseBody
    MessageData forgetModeifyPwd(@RequestBody ModelInfo modelInfo, HttpServletRequest request, HttpSession httpSession) {
        //name
        String name = modelInfo.getName();
        User user = UserUtils.getByLoginName(name);
        systemService.updatePasswordById(user.getId(), user.getLoginName(), modelInfo.getPassword());
        return MessageData.success();
    }

    @RequestMapping(value = {"preSetAppListUSer"})
    public String preSetAppListUSer(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        List<TlApps> applist = tlAppsService.findList(new TlApps());
        model.addAttribute("applist", applist);

        List<TlCompanyInfo> companyinfolist = tlCompanyInfoService.findList(new TlCompanyInfo());
        List<TlFactory> factorylist = new ArrayList<TlFactory>();
        for(int i=0;i<companyinfolist.size();i++) {
            TlFactory tf = new TlFactory();
            TlCompanyInfo tc = companyinfolist.get(i);
            tf.setName(tc.getFactoryName());
            factorylist.add(tf);
        }
        model.addAttribute("factorylist", factorylist);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);

        return "taier/preSetAppListUSer";
    }

    @RequestMapping(value = "preSetAppListUSerQry")
    @ResponseBody
    public MessageData preSetAppListUSerQry(@RequestBody ModelInfo modelInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        TlApppreset tlApppreset = new TlApppreset();
        tlApppreset.setModelInfo(modelInfo);
        Page<TlApppreset> page = tlApppresetService.userpresetqry(new Page<TlApppreset>(request, response), tlApppreset);
        return MessageData.success().addMsg("page", page);
    }

    @RequestMapping(value = {"preSetAppDetailUSer"})
    public String preSetAppDetailUSer(TlApppreset tlApppreset, HttpServletRequest request, HttpServletResponse response, Model model) {
        tlApppreset = tlApppresetService.get(tlApppreset.getId());
        String apps = tlApppreset.getApps();
        if(StringUtils.isEmpty(apps)) {
            apps = "";
        }
        String[] appary = apps.split("\\|\\|");
        List<TlApps> applist = new ArrayList<TlApps>();
        for (int i = 0; i < appary.length; i++) {
            String id = appary[i];
            TlApps tlApps = tlAppsService.get(id);
            applist.add(tlApps);
        }
        model.addAttribute("tlApppreset",tlApppreset);
        model.addAttribute("applist", applist);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "taier/preSetAppDetailUSer";
    }


    @RequestMapping(value = {"unionInfoListUSer"})
    public String unionInfoListUSer(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        List<TlApps> applist = tlAppsService.findList(new TlApps());
        model.addAttribute("applist", applist);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        List<TlFactory> factorylist = tlFactoryService.findList(new TlFactory());
        AdCertificate adCertificate=adCertificateService.getAdCertificate();
        model.addAttribute("factorylist", factorylist);
        model.addAttribute("adCertificate", adCertificate);
        String pp = request.getParameter("pp");
        String nc = request.getParameter("nc");
        String cc = request.getParameter("cc");
        String text = request.getParameter("text");

        model.addAttribute("pp", pp);
        model.addAttribute("nc", nc);
        model.addAttribute("cc", cc);
        model.addAttribute("text", text);
        return "taier/unionInfoListUSer";
    }

    @RequestMapping(value = "unionInfoListUSerQry")
    @ResponseBody
    public MessageData unionInfoListUSerQry(@RequestBody ModelInfo modelInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        TlCompanyUnionInfo tlCompanyUnionInfo = new TlCompanyUnionInfo();
        tlCompanyUnionInfo.setModelInfo(modelInfo);
        Page<TlCompanyUnionInfo> page = tlCompanyUnionInfoService.userunioninfoqry(new Page<TlCompanyUnionInfo>(request, response), tlCompanyUnionInfo);
        return MessageData.success().addMsg("page", page);
    }

    @RequestMapping(value = {"unionInfoDetailUSer"})
    public String unionInfoDetailUSer(TlCompanyUnionInfo tlCompanyUnionInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        String type = tlCompanyUnionInfo.getType();
        String pp = tlCompanyUnionInfo.getPp();
        String nc = tlCompanyUnionInfo.getNc();
        String cc = tlCompanyUnionInfo.getCc();
        tlCompanyUnionInfo = tlCompanyUnionInfoService.get(tlCompanyUnionInfo.getId());
        model.addAttribute("tlCompanyUnionInfo", tlCompanyUnionInfo);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        model.addAttribute("type", type);
        model.addAttribute("pp", pp);
        model.addAttribute("nc", nc);
        model.addAttribute("cc", cc);
        return "taier/unionInfoDetailUSer";
    }

    @RequestMapping("${frontPathOne}/gotoLogin")
    public String gotoLogin(HttpServletRequest request) {
        return "modules/front/login";
    }

    @RequestMapping("${frontPathOne}/companyInfo")
    public String gotoCompanyInfo(HttpServletRequest request) {

        return "taier/company/companyInfo";
    }

    @RequestMapping("/gotoMain")
    public String gotoMain(HttpServletRequest request, Model model) {
        String type = request.getParameter("type");
        model.addAttribute("type", type);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "taier/main";
    }

    @RequestMapping("/gotoAboutUs")
    public String gotoAboutUs(HttpServletRequest request, Model model) {
        AboutUs aboutUs = aboutUsService.getLastAboutUs();
        model.addAttribute("aboutUs", aboutUs);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "taier/aboutUs";
    }

    @RequestMapping("/gotoConnectUs")
    public String gotoConnectUs(HttpServletRequest request, Model model) {
        AboutUs aboutUs = aboutUsService.getLastAboutUs();
        model.addAttribute("aboutUs", aboutUs);
        return "taier/connectUs";
    }

    @RequestMapping("/gotoNews")
    public String gotoNews(HttpServletRequest request, Model model) {
        List<News> hotNews = newsService.getHotNewsList();
        List<News> resultHotNewsList = new ArrayList<News>();
        Map<String, String> imgMap;
        News resultNews;
        for (News news : hotNews) {
            imgMap = StringUtils.getImgStr(news.getContent());
            if (imgMap.size() > 0) {
                resultNews = new News();
                resultNews.setId(news.getId());
                resultNews.setTitle(news.getTitle());
                resultNews.setImg(imgMap.get("1"));
                resultHotNewsList.add(resultNews);
            }
            if (resultHotNewsList.size() >= 3) {
                break;
            }


        }
        model.addAttribute("resultHotNewsList", resultHotNewsList);
        List<News> resultRollNewsList = new ArrayList<News>();
        List<News> rollNewsList=newsService.getRollNewsList();
        for (News rollNews : rollNewsList) {
            imgMap = StringUtils.getImgStr(rollNews.getContent());
            resultNews = new News();
            resultNews.setId(rollNews.getId());
            resultNews.setTitle(rollNews.getTitle());
            resultNews.setImg(imgMap.get("1"));
            resultRollNewsList.add(resultNews);
            /*if (resultRollNewsList.size() > 3) {
                break;
            }
*/

        }
        model.addAttribute("resultRollNewsList", resultRollNewsList);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "taier/news";
    }

    @RequestMapping("/gotoNewsDetail")
    public String gotoNewsDetail(HttpServletRequest request, Model model) {
        String id = request.getParameter("id");
        News news = newsService.get(id);

        model.addAttribute("news", news);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "taier/newsDetail";
    }

    /*@RequestMapping("/gotoLatestActivity")
    public String gotoLatestActivity(HttpServletRequest request,Activity activity, Model model) {
        activityService.findPage(page, activity);
        return "taier/latestActivity";
    }*/
    @RequestMapping("/gotoFirstPage")
    public String gotoFirstPage(HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<TlApppreset> page = new Page<TlApppreset>(request, response);
        page.setPageSize(6);
        ModelInfo modelInfo = new ModelInfo();
        TlApppreset tlApppreset = new TlApppreset();
        tlApppreset.setModelInfo(modelInfo);
        Page<TlApppreset> setlist = tlApppresetService.userpresetqry(page, tlApppreset);
        model.addAttribute("setlist", setlist.getList());

    	/*List<News> newsList=newsService.getFirstPageNews();*/
        List<FirstPageImg> firstPageImgList = firstPageImgService.getFirstPageImgList();
        model.addAttribute("firstPageImgList", firstPageImgList);
        
        List<CustomerService> customerServiceList=customerServiceService.getCustomerServiceList();
        model.addAttribute("customerServiceList", customerServiceList);
        
        //首页证书内容显示
        CertificateFirstPage certificateFirstPage=certificateFirstPageService.getOneCertificateFirstPage();
        model.addAttribute("certificateFirstPage", certificateFirstPage);
        //企业信息发布
        Page<TlCompanyUnionInfo> comanyUnionInfoPage = new Page<TlCompanyUnionInfo>(request, response);
        comanyUnionInfoPage.setPageSize(6);
        TlCompanyUnionInfo tlCompanyUnionInfo=new TlCompanyUnionInfo();
        Page<TlCompanyUnionInfo> companyUnionInfolist=tlCompanyUnionInfoService.findPage(comanyUnionInfoPage, tlCompanyUnionInfo);
        model.addAttribute("companyUnionInfolist", companyUnionInfolist.getList());
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "taier/firstPage";
    }

    @RequestMapping("/gotologin")
    public String gotologin1(HttpServletRequest request, Model model) {
        return "modules/taiercomp/login";
    }

    @RequestMapping(value = "/logout1", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        SystemAuthorizingRealm.Principal principal = UserUtils.getPrincipal();
        if(principal != null){
            UserUtils.getSubject().logout();
        }
        return "redirect:" + "/taier/jump/sysLogin";
    }

    @RequestMapping(value = "/logout2", method = RequestMethod.GET)
    public String logout2(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        SystemAuthorizingRealm.Principal principal = UserUtils.getPrincipal();
        if(principal != null){
            UserUtils.getSubject().logout();
        }
        return "redirect:" + "/fo/login?t";
    }

    @RequestMapping("/gotoEnterNet")
    public String gotoEnterNet(HttpServletRequest request, Model model) {
        return "taier/enterNet";
    }

    @RequestMapping(value = "qryQrCode")
    @ResponseBody
    public MessageData qryQrCode( HttpServletRequest request, HttpServletResponse response, Model model) {
        TlQrcode tlQrcode = new TlQrcode();
        List<TlQrcode> list = tlQrcodeService.findList(tlQrcode);
        if(list.size() > 0) {
            tlQrcode = list.get(0);
        }
        return MessageData.success().addMsg("tlQrcode", tlQrcode);
    }

    @RequestMapping(value = "qryConnectUs")
    @ResponseBody
    public MessageData qryConnectUs( HttpServletRequest request, HttpServletResponse response, Model model) {
        AboutUs aboutUs = aboutUsService.getLastAboutUs();
        return MessageData.success().addMsg("aboutUs", aboutUs);
    }

    //跳转泰尔证书页
    @RequestMapping(value = "gotoTaierauth")
    public String gotoTheNet1 (HttpServletRequest request, HttpServletResponse response, Model model) {
        AboutUs aboutUs=aboutUsService.getLastAboutUs();
        if(aboutUs!=null){
            String situationContent=aboutUs.getSituationContent();
            String sitContentResult=StringUtils.getDelImg(situationContent);
            aboutUs.setSituationContent(sitContentResult);
        }
        model.addAttribute("aboutUs",aboutUs);
        
        //证书展示
        List<CertificateShow> certificateShowList=certificateShowService.findList(new CertificateShow());
        model.addAttribute("certificateShowList",certificateShowList);
        
        //获证展示
        List<Certificate> certificateList=certificateService.findList(new Certificate());
        model.addAttribute("certificateList",certificateList);
        
        Contact contact=contactService.getLastContact();
        model.addAttribute("contact",contact);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "/taier/taierauth";
    }
    
    //跳转泰尔证书页
    @RequestMapping(value = "gotoTaierauthDetail")
    public String gotoTaierauthDetail (HttpServletRequest request, HttpServletResponse response, Model model) {
    	String id=request.getParameter("id");
    	Certificate certificate=certificateService.get(id);
    	model.addAttribute("certificate",certificate);
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        model.addAttribute("linkList", linkList);
        return "/taier/taierauthDetail";
    }

    @RequestMapping(value ="findTaierauth")
    @ResponseBody
    public MessageData findTaierauth(CertificateShow certificateShow, HttpServletRequest request, HttpServletResponse response) {
        //证书展示
        Page<CertificateShow> certificateShowPage=certificateShowService.findPage(new Page<CertificateShow>(request, response), certificateShow);
        return MessageData.success().addMsg("certificateShowPage", certificateShowPage);
    }

    @RequestMapping(value ="getLinks")
    @ResponseBody
    public MessageData getLinks(HttpServletRequest request, HttpServletResponse response) {
        List<TlLink> linkList = tlLinkService.findList(new TlLink());
        return MessageData.success().addMsg("linkList", linkList);
    }

    @RequestMapping(value ="getCustomer")
    @ResponseBody
    public MessageData getCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerService> customerServiceList=customerServiceService.getCustomerServiceList();
        return MessageData.success().addMsg("customerServiceList", customerServiceList);
    }
}