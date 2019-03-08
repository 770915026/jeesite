package com.thinkgem.jeesite.modules.front.web;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.modules.front.frontUtils.MessageData;

/**
 * 生成验证码action
 * 
 * @author wangyy
 *
 */
@Controller
@RequestMapping("/code")
public class VerifyAction {
	/**
	 * 生成验证码，用户校验
	 * 
	 * @author wangyy
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/verify", method = RequestMethod.GET)
	public void verify(HttpServletRequest request, HttpServletResponse response) {

		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		// 指定生成的响应是图片
		response.setContentType("image/jpeg");
		int width = 200;
		int height = 60;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); // 创建BufferedImage类的对象
		Graphics g = image.getGraphics(); // 创建Graphics类的对象
		Graphics2D g2d = (Graphics2D) g; // 通过Graphics类的对象创建一个Graphics2D类的对象
		Random random = new Random(); // 实例化一个Random对象
		Font mFont = new Font("华文宋体", Font.BOLD, 80); // 通过Font构造字体
		g.setColor(getRandColor(200, 250)); // 改变图形的当前颜色为随机生成的颜色
		g.fillRect(0, 0, width, height); // 绘制一个填色矩形

		// 画一条折线
		BasicStroke bs = new BasicStroke(2f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL); // 创建一个供画笔选择线条粗细的对象
		g2d.setStroke(bs); // 改变线条的粗细
		g.setColor(Color.DARK_GRAY); // 设置当前颜色为预定义颜色中的深灰色
		int[] xPoints = new int[3];
		int[] yPoints = new int[3];
		for (int j = 0; j < 3; j++) {
			xPoints[j] = random.nextInt(width - 1);
			yPoints[j] = random.nextInt(height - 1);
		}
		g.drawPolyline(xPoints, yPoints, 3);
		// 生成并输出随机的验证文字
		g.setFont(mFont);
		int itmp = 0;
		String validateCode = "";
		for (int i = 0; i < 4; i++) {
			if (random.nextInt(2) == 1) {
				itmp = random.nextInt(26) + 65; // 生成A~Z的字母
			} else {
				itmp = random.nextInt(10) + 48; // 生成0~9的数字
			}
			char ctmp = (char) itmp;
			Color color = new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110));
			g.setColor(color);

			Graphics2D g2d_word = (Graphics2D) g;
			AffineTransform trans = new AffineTransform();
			trans.scale(0.8f, 0.8f);
			g2d_word.setTransform(trans);
			/************************/

			g.drawString(String.valueOf(ctmp), 45 * i + 10, 65);
			validateCode += ctmp;
		}

		request.getSession().setAttribute("validateCode", validateCode);

		g.dispose();
		ServletOutputStream sos;
		try {
			sos = response.getOutputStream();
			ImageIO.write(image, "jpeg", sos);      
			sos.close();      
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		//ImageIO.write(image, "JPEG", response.getOutputStream());
		// sRand=null;

	}

	/**
	 * 生成随机的图片
	 * 
	 * @author wangyy
	 * @param s
	 * @param e
	 * @return
	 */
	private Color getRandColor(int s, int e) {
		Random random = new Random();
		if (s > 255)
			s = 255;
		if (e > 255)
			e = 255;
		int r = s + random.nextInt(e - s);
		int g = s + random.nextInt(e - s);
		int b = s + random.nextInt(e - s);
		return new Color(r, g, b);
	}
	
	@RequestMapping(value = "/checkCode", method = RequestMethod.POST)
	@ResponseBody
	public MessageData checkCode(HttpServletRequest request) {
		String code = (String)request.getSession().getAttribute("validateCode");
		String validateCode = request.getParameter("validateCode"); 
		if(validateCode.toUpperCase().equals(code)){
			return MessageData.success();
		}else{
			return MessageData.failed();
		}
		
	}

}