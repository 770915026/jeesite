package com.thinkgem.jeesite.modules.front.frontUtils;

import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;

public class SendMessageUtil extends HttpServlet {	
	private static final Logger logger = LoggerFactory.getLogger(SendMessageUtil.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
     *  发送短息
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public static void sendMsgUtf8(String phones, String content){
        //请求地址请登录253云通讯自助通平台查看或者询问您的商务负责人获取
        String smsSingleRequestServerUrl = "http://smsbj1.253.com/msg/send/json";
        // 短信内容
        String msg = "【合影网络科技】" + content;
        //手机号码
        String phone = phones;
        //状态报告
        String report= "true";

        /*SmsSendRequest smsSingleRequest = new SmsSendRequest("N7343955", "tYFGzRKyI79295", msg, phone,report);*/
        SmsSendRequest smsSingleRequest = new SmsSendRequest("N524164_N7343955", "crbTQ1voEtf628", msg, phone,report);
        
        String requestJson = JSON.toJSONString(smsSingleRequest);

        System.out.println("before request string is: " + requestJson);

        String response = ChuangLanSmsUtil.sendSmsByPost(smsSingleRequestServerUrl, requestJson);

        System.out.println("response after request result is :" + response);

        SmsSendResponse smsSingleResponse = JSON.parseObject(response, SmsSendResponse.class);

        System.out.println("response  toString is :" + smsSingleResponse);
    }
}

