package com.thinkgem.jeesite.modules.front.frontUtils;

/**
 * properties文件key配置接口，全部配置在本接口中，就不需要在各引用的类中去查找写死的key了
 * 
 * @author HEC
 *
 */
public interface ApplicationConfig {
	/*
	 * 全局配置文件类，配置文件中的属性全部加入本类--by hanenchao
	 */
	public static String CONFIG_FILE_NAME = "config.properties";// properties配置文件名,要指定路径，默认CLASSPATH //$NON-NLS-1$
	public static String CREATE_IP = "47.106.191.32";
	public static String NOTIFY_URL = "http://www.graphskey.com/payNotify";
	public static final String APPID  = "appid";
	public static final String APPSECRET="appsecret";
	public static final String ANGENTID="agentid";
	
	public static final String PAY_APPID  = "pay_appid";
	public static final String MCH_ID  = "mch_id";
	public static final String KEY  = "key";
	
	public static final String WEIXIN_GETUSERINFO_URL="https://api.weixin.qq.com/sns/userinfo";
	public static final String WEIXIN_SENDMESSAGE_URL="https://qyapi.weixin.qq.com/cgi-bin/message/send";
	
	public static final String WEIXIN_GETTOKEN_URL="https://api.weixin.qq.com/sns/oauth2/access_token";
	public static final String WEIXIN_GET_CODE_URL="https://open.weixin.qq.com/connect/qrconnect";
	public static final String BIZPAYURL="weixin://wxpay/bizpayurl";
	public static final String UNIFIEDORORDERURL=  "https://api.mch.weixin.qq.com/pay/unifiedorder";
}
