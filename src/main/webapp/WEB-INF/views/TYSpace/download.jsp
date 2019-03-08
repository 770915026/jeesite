<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 out.clear();
     out = pageContext.pushBody();
     response.setContentType("application/x-msdownload");
     String wjm  = RequestUtils.getParam(request, "wjm");
     String path = RequestUtils.getParam(request, "path");
     response.addHeader("Content-Disposition","attachment;fileName="+CommFunction.toUtf8String(wjm));
     OutputStream os = response.getOutputStream(); 
     FileInputStream fis = new FileInputStream(path); 
     try{
         byte[] b = new byte[1024]; 
         int m = 0;
         while ( (m = fis.read(b)) > 0 ){ 
             os.write(b, 0, m); //写文件
         } 
         fis.close(); 
         os.flush(); 
         os.close(); 
     }
     catch(Exception e){
         fis.close();
         os.flush();
         os.close();
     }
%>