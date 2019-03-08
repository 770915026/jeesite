package com.thinkgem.jeesite.modules.cms.web;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
  
  
//import com.tgb.web.controller.entity.User;  

@Controller
@RequestMapping("/file")
public class UploadAndTransferController {   

    @RequestMapping(value = "/upload", method = RequestMethod.POST)

    public void upload(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "fileArray") MultipartFile[] files, ModelMap model) {
        String agent=request.getHeader("User-Agent").toLowerCase();

        String ue = request.getParameter("ue");
        Calendar cal = Calendar.getInstance();
        String p = "upload"+"/"+ UUID.randomUUID();
        Map<String,Object> mapresponse=new HashMap<String,Object>();
        String tomcatPath=System.getProperty("catalina.base");
        System.out.println(tomcatPath);
        //String path = request.getSession().getServletContext().getRealPath(p);
        String path=tomcatPath+System.getProperty("file.separator")+p;
        List<String> filepaths = new ArrayList<String>();
        for (int i = 0; i < files.length; i++) {
            String fileName = files[i].getOriginalFilename();
            if(StringUtils.isNotEmpty(ue) && "1".equals(ue)) {
                fileName = UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
            }
            File targetFile = new File(path, fileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            try {
                files[i].transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //filepaths.add(request.getContextPath() + "/" + p + "/" + fileName);
            filepaths.add("/basePath/" + p + "/" + fileName);
        }
        String fileUrl = "";
        for(int i=0;i<filepaths.size();i++){
            fileUrl += filepaths.get(i) + "|";
        }
        if(StringUtils.isNotEmpty(fileUrl)) {
            fileUrl = fileUrl.substring(0,fileUrl.length()-1);
        }
        mapresponse.put("fileUrl", fileUrl);
        mapresponse.put("status", "success");
        if(agent.indexOf("msie")>0){
            JsonMapper.writeJsonForDesIE(mapresponse, response);
        } else {
            JsonMapper.writeJsonForDes(mapresponse, response);
        }

    }


    @RequestMapping("/toUpload" )
    public String toUpload() {  
          
        return "/upload";  
    }  
      
}  