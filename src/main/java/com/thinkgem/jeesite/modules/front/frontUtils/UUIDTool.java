package com.thinkgem.jeesite.modules.front.frontUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class UUIDTool {

	 /**  
     * 自动生成32位的UUid，对应数据库的主键id进行插入用。  
     * @return  
     */  
	 public static String getUUID() {  
	        /*UUID uuid = UUID.randomUUID();  
	        String str = uuid.toString();  
	        // 去掉"-"符号  
	        String temp = str.substring(0, 8) + str.substring(9, 13)  
	                + str.substring(14, 18) + str.substring(19, 23)  
	                + str.substring(24);  
	        return temp;*/  
	        return UUID.randomUUID().toString().replace("-", "");  
	  } 
	 public static String getOrderNo(){
		  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		  Date date = new Date();
		  String str = simpleDateFormat.format(date);
		  System.out.println(simpleDateFormat);
		  Random random = new Random();
		  int rannum = (int) (random.nextDouble() * (9999 - 1000 + 1)) + 1000;
		  return str+rannum;
	}
  
}
