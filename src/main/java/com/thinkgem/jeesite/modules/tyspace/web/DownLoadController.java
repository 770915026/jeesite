package com.thinkgem.jeesite.modules.tyspace.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;

@Controller
@RequestMapping(value = "/file")
public class DownLoadController extends BaseController{
	
	@RequestMapping(value = "download")
	public void downLoad(HttpServletRequest request,HttpServletResponse response){
		String fileName = request.getParameter("fileName");
		System.err.println("abcddddddddd");
		try {  
            // 获取上传文件的目录  
            ServletContext sc = request.getSession().getServletContext();  
            // 上传位置  
            String fileSaveRootPath = sc.getRealPath("/tempFiles");  
            // 得到要下载的文件  
            File file = new File(fileSaveRootPath + "\\" + fileName);   
            // 设置响应头，控制浏览器下载该文件  
            response.setHeader("content-disposition", "attachment;filename="  
                    + URLEncoder.encode(fileName, "UTF-8"));  
            // 读取要下载的文件，保存到文件输入流  
            FileInputStream in = new FileInputStream(fileSaveRootPath + "\\" + fileName);  
            // 创建输出流  
            OutputStream out = response.getOutputStream();  
            // 创建缓冲区  
            byte buffer[] = new byte[1024];  
            int len = 0;  
            // 循环将输入流中的内容读取到缓冲区当中  
            while ((len = in.read(buffer)) > 0) {  
                // 输出缓冲区的内容到浏览器，实现文件下载  
                out.write(buffer, 0, len);  
            }  
            // 关闭文件输入流  
            in.close();  
            // 关闭输出流  
            out.close();  
            //下载完成，删除文件
            //file.delete();
        } catch (Exception e) {  

        }
	}
}
