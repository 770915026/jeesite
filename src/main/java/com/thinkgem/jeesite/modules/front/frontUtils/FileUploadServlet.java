package com.thinkgem.jeesite.modules.front.frontUtils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import sun.misc.BASE64Decoder;

@SuppressWarnings("restriction")
public class FileUploadServlet extends HttpServlet {	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadServlet.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("name====>"+request.getParameter("name"));
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存缓冲区，超过后写入临时文件
		factory.setSizeThreshold(10240000);
		// 设置临时文件存储位置
		String base = request.getContextPath()+"/uploadFiles";
		File file = new File(base);
		if(!file.exists())
			file.mkdirs();
		factory.setRepository(file);
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置单个文件的最大上传值
		upload.setFileSizeMax(10002400000l);
		// 设置整个request的最大值
		upload.setSizeMax(10002400000l);
		upload.setHeaderEncoding("UTF-8");
		
		try {
			List<?> items = upload.parseRequest(request);
			FileItem item = null;
			String fileName = null;
			for (int i = 0 ;i < items.size(); i++){
				item = (FileItem) items.get(i);
				fileName = base + File.separator + item.getName();
				// 保存文件
				if (!item.isFormField() && item.getName().length() > 0) {
					item.write(new File(fileName));
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 多文件上传
	 * 
	 * @param request
	 * @param response
	 * @param files
	 * @param realPath
	 * @return
	 */
	public static List<String> upload(HttpServletRequest request, HttpServletResponse response, MultipartFile[] files,
			String realPath) {
		List<String> list = new ArrayList<>();
		// 判断file数组不能为空并且长度大于0
		if (files != null && files.length > 0) {
			// 循环获取file数组中得文件
			// logger.info(files.length);
			for (int i = 0; i < files.length; i++) {
				MultipartFile file = files[i];
				// 保存文件
				if (file != null) {
					// 取得当前上传文件的文件名称
					String fileName = file.getOriginalFilename();

					// String fileType=file.getContentType();

					// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
					if (fileName.trim() != "") {
						logger.info("fileName::" + fileName);
						String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
						// 定义上传路径
						// String path =
						// request.getServletContext().getRealPath("/"+realPath);
						String path = System.getProperty("catalina.base") + "/upload/photoGraphy/" + realPath;
						logger.info("path=" + path);
						// String path = "D:\\workspace\\image";
						String localpath = "/" + System.currentTimeMillis() + "." + fileType;
						// String localRealPath="/"+realPath+localpath;
						String imgUrl = "/basePath";
						String localRealPath = imgUrl + "/" + realPath + localpath;
						list.add(localRealPath);
						logger.info(path + localpath);
						File localFile = new File(path + localpath);
						if (!localFile.exists()) {
							localFile.mkdirs();
						}
						try {
							file.transferTo(localFile);
							logger.info(" upload success ...");
						} catch (Exception e) {
							logger.info(" upload  failed ...");
						}
					} else {
						String localRealPath = null;
						list.add(localRealPath);
					}

				} else {
					String localRealPath = null;
					list.add(localRealPath);
				}

			}
		}
		return list;
	}
	/**
	 * 上传压缩图片
	 * @param file
	 * @param request
	 * @param realPath
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	 public static String uploadThumbnailFile(MultipartFile file,HttpServletRequest request,String realPath) throws FileNotFoundException, IOException {
	        String resultStr = null;
		 	if(file == null ){
	            return null;
	        }
	        
	        if (file.getSize() >= 20*1024*1024)
	        {
	        	return null;
	        }
	        String fileName = file.getOriginalFilename();
	        if (fileName.trim() != "") {
	        	String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
	        	String path = System.getProperty("catalina.base") + "/upload/photoGraphy/" + realPath;
	        	String localpath = "/" + System.currentTimeMillis() + "." + fileType;
	        	String imgUrl = "/basePath";
				String localRealPath = imgUrl + "/" + realPath + localpath;
				resultStr=localRealPath;
				
				File fileDir = new File(path);
				if (!fileDir.exists()) {
					fileDir.mkdirs();
				}
				String savePath=path + localpath;
		        CommonsMultipartFile cf = (CommonsMultipartFile) file;//此处file 是你的MultipartFile
		        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
		        File fromPic = fi.getStoreLocation();
		        BufferedImage sourceImg=ImageIO.read(new FileInputStream(fromPic));
		        int fileWidth=sourceImg.getWidth();
		        double scale = 1.0d ;
		        if(fileWidth>1920){
		        	scale=1920f/fileWidth;
		        }
		        try{
		        
		        	Thumbnails.of(file.getInputStream()).scale(1f).outputQuality(scale).toFile(savePath);
		        	//Thumbnails.of(fromPic).outputQuality(scale).toFile(localFile);
		        	/*if(size < 200*1024){
			        	Thumbnails.of(fromPic).scale(1f).outputFormat("jpg").toFile(localFile);
		                Thumbnails.of(filePathName).scale(1f).outputFormat("jpg").toFile(thumbnailFilePathName);
		            }else{
		                Thumbnails.of(filePathName).scale(1f).outputQuality(scale).outputFormat("jpg").toFile(thumbnailFilePathName);
		            	Thumbnails.of(fromPic).outputQuality(scale).toFile(localFile);
		            }*/
		        } catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return resultStr;
				}
		        
				
	        }
	        return resultStr;
	    }
	public static void deleteImg(String url, String realPath) {

		String path = System.getProperty("catalina.base") + "/upload/photoGraphy/"+realPath;

		String imgUrl = "";
		imgUrl = path + url.substring(url.lastIndexOf("/"));
		if (imgUrl !=null && !"".equals(imgUrl)) {
			File file = new File(imgUrl);
			if (file.exists()) {
				file.delete();
				logger.info("已删除：" + imgUrl);
			}
		}
	}
	public static byte[] base64ToByte(String base64Str) {
		base64Str=base64Str.split(",")[1];
		BASE64Decoder decode = new BASE64Decoder();
		// byte[] buff = Convert.FromBase64String(base64Str);
		byte[] buff = null;
		try {
			buff = decode.decodeBuffer(base64Str);
			for (int i = 0; i < buff.length; ++i) {
				if (buff[i] < 0) {// 调整异常数据
					buff[i] += 256;
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return buff;
	}
	/**
	 * 上传byte文件
	 * @param fileByte
	 * @param realPath
	 * @param fileType
	 * @return
	 * @throws FileNotFoundException
	 */
	public static String saveByteFile(byte[] fileByte,String realPath,String fileType) throws FileNotFoundException{
		String path = System.getProperty("catalina.base") + "/upload/photoGraphy/" + realPath;
		String localpath = "/" + System.currentTimeMillis() + "." + fileType;
		// String localRealPath="/"+realPath+localpath;
		String imgUrl = "/basePath";
		
		File localFile = new File(path);
		if (!localFile.exists()) {
			localFile.mkdirs();
		}
		String localRealPath = imgUrl + "/" + realPath+localpath;
		path+=localpath;
		FileOutputStream fos = new FileOutputStream(path);   
	    try {
			fos.write(fileByte,0,fileByte.length);
			fos.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		}
	    return localRealPath;  
	    
	}
	/**
	 * 上传单个文件
	 * @param file
	 * @param realPath
	 * @return
	 */
	public static String uploadOneFile(MultipartFile file,String realPath) {
		String localRealPath=null;
		if (file != null) {
			// 取得当前上传文件的文件名称
			String fileName = file.getOriginalFilename();

			// String fileType=file.getContentType();

			// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
			if (fileName.trim() != "") {
				logger.info("fileName::" + fileName);
				String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
				logger.info(fileType);
				// 定义上传路径
				// String path =
				// request.getServletContext().getRealPath("/"+realPath);
				String path = System.getProperty("catalina.base") + "/upload/photoGraphy/" + realPath;
				logger.info("path=" + path);
				// String path = "D:\\workspace\\image";
				String localpath = "/" + System.currentTimeMillis() + "." + fileType;
				// String localRealPath="/"+realPath+localpath;
				String imgUrl = "/basePath";
				localRealPath = imgUrl + "/" + realPath + localpath;
				logger.info(path + localpath);
				File localFile = new File(path + localpath);
				if (!localFile.exists()) {
					localFile.mkdirs();
				}
				try {
					file.transferTo(localFile);
					logger.info(" upload success ...");
				} catch (Exception e) {
					logger.info(" upload  failed ...");
				}
			} else {
				localRealPath = null;
			}

		} else {
			localRealPath = null;
		}
		return localRealPath;
	}
}

