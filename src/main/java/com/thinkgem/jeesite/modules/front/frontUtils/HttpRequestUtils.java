package com.thinkgem.jeesite.modules.front.frontUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import net.sf.json.JSONObject;



public class HttpRequestUtils {
	 public static JSONObject httpRequest(String requestUrl, String outputStr, String method) {
	        JSONObject jsonObject = null;
	        StringBuffer buffer = new StringBuffer();
	        try {
	            // // 创建SSLContext对象，并使用我们指定的信任管理器初始化
	            // TrustManager[] tm = { new MyX509TrustManager() };
	            // SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
	            // sslContext.init(null, tm, new java.security.SecureRandom());
	            // 从上述SSLContext对象中得到SSLSocketFactory对象
	            // SSLSocketFactory ssf = sslContext.getSocketFactory();

	            URL url = new URL(requestUrl);
	            HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
	            // httpUrlConn.setSSLSocketFactory(ssf);

	            httpUrlConn.setDoOutput(true);
	            httpUrlConn.setDoInput(true);
	            httpUrlConn.setUseCaches(false);
	            // 设置请求方式（GET/POST）
	            httpUrlConn.setRequestMethod(method);
	            httpUrlConn.connect();

	            // 当有数据需要提交时
	            if (null != outputStr) {
	                OutputStream outputStream = httpUrlConn.getOutputStream();
	                // 注意编码格式，防止中文乱码
	                outputStream.write(outputStr.getBytes("UTF-8"));
	                outputStream.close();
	            }
	            // 将返回的输入流转换成字符串
	            InputStream inputStream = httpUrlConn.getInputStream();
	            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
	            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

	            String str = null;
	            while ((str = bufferedReader.readLine()) != null) {
	                buffer.append(str);
	            }
	            bufferedReader.close();
	            inputStreamReader.close();
	            // 释放资源
	            inputStream.close();
	            inputStream = null;
	            httpUrlConn.disconnect();
	            jsonObject = JSONObject.fromObject(buffer.toString());
	            System.out.println("http-back:" + jsonObject);
	        } catch (ConnectException ce) {
	            System.err.println("Weixin server connection timed out.");
	        } catch (Exception e) {
	            System.err.println("https request error:{}" + e);
	        }
	        return jsonObject;
	    }
	 
	 public static void connectionUrl(String username,String password,String basePath){
	        String url = "/fo/login";

	        String responseMessage = ""; 
	        StringBuffer response = new StringBuffer(); 
	        HttpURLConnection httpConnection = null; 
	        OutputStreamWriter out = null; 
	        BufferedReader reader = null; 
	        try { 
	          URL urlPost = new URL(url); 
	          httpConnection = (HttpURLConnection) urlPost.openConnection(); 
	          httpConnection.setDoOutput(true); 
	          httpConnection.setDoInput(true); 
	          // 参数长度太大，不能用get方式 
	          httpConnection.setRequestMethod("POST"); 
	          // 不使用缓存 
	          httpConnection.setUseCaches(false); 
	          // URLConnection.setInstanceFollowRedirects是成员函数，仅作用于当前函数 
	          httpConnection.setInstanceFollowRedirects(true); 
	          // 配置本次连接的Content-type，配置为application/x-www-form-urlencoded的 
	          // 意思是正文是urlencoded编码过的form参数 
	          httpConnection.setRequestProperty("Connection", "Keep-Alive");
	          // 设置请求头信息
	          httpConnection.setRequestProperty("Charset", "UTF-8");
	          // 设置边界
	          String BOUNDARY = "----------" + System.currentTimeMillis();
	          httpConnection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);
	          //httpConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); 

	          // 连接，从postUrl.openConnection()至此的配置必须要在connect之前完成， 
	          // 要注意的是connection.getOutputStream会隐含的进行connect。 
	          // 实际上只是建立了一个与服务器的tcp连接，并没有实际发送http请求。 

	          httpConnection.connect(); 
	          out = new OutputStreamWriter(httpConnection.getOutputStream(),"UTF-8"); 

	          // 正文，正文内容其实跟get的URL中'?'后的参数字符串一致 

	          /*JSONObject jsonObject=new JSONObject(); 
	          try{
	              jsonObject.put("username", username); 
	              jsonObject.put("password", password); 
	              jsonObject.put("captcha", captcha); 
	          }catch(Exception e){
	              e.printStackTrace();
	          }*/
	          /*
	          Map parames = new HashMap<String, String>();  
	            parames.put("username", "username");  
	            parames.put("username", "username");  
	            parames.put("captcha", "captcha");  
	          */
	          // 构建请求参数  
	            StringBuffer sb = new StringBuffer();  
	            sb.append("username="+username+"&password="+password);
	          //写入参数,DataOutputStream.writeBytes将字符串中的16位的unicode字符以8位的字符形式写道流里面 
	          out.write(sb.toString()); 
	          System.out.println("send_url:" + url);  
	          System.out.println("send_data:" + sb.toString());  
	          // flush and close 
	          out.flush(); 

	        } catch (Exception e) {  
	            e.printStackTrace();  
	        } finally {  
	             try { 
	                if (null != out) { 
	                  out.close(); 
	                } 
	                if (null != reader) { 
	                  reader.close(); 
	                } 
	                if (null != httpConnection) { 
	                  httpConnection.disconnect(); 
	                } 
	              } catch (Exception e2) { 
	                  e2.printStackTrace();
	              }
	        }  

	        try {
	          reader = new BufferedReader(new InputStreamReader(httpConnection.getInputStream(),"UTF-8")); 
	          while ((responseMessage = reader.readLine()) != null) { 
	              response.append(responseMessage); 
	              response.append("\n"); 
	          } 

	          if (!"failure".equals(response.toString())) { 
	              System.out.println("success");
	          } else { 
	              System.out.println("failue");
	          } 
	          // 将该url的配置信息缓存起来 
	          
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	
}
