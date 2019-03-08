package com.thinkgem.jeesite.modules.front.frontUtils;



import java.io.IOException;
import java.util.Properties;
import org.apache.log4j.Logger;

public class PropertiesReaderUtil {
	public static final Logger logger = Logger.getLogger(PropertiesReaderUtil.class);

	private static final PropertiesReaderUtil onlyOne = new PropertiesReaderUtil();

	private Properties p ;
	
	private PropertiesReaderUtil() {

	}

	public static PropertiesReaderUtil getInstace() {
		return onlyOne;
	}

	/**
	 * 读取文件到Properties类中
	 * @param fileName
	 * @throws IOException
	 */
	public void readPropertyFile(String fileName) {
		
		if (fileName == null || fileName == "") { //$NON-NLS-1$
			logger.error("读取properties文件失败,未传入文件 名"); //$NON-NLS-1$
			throw new RuntimeException("请指定一个.properties文件"); //$NON-NLS-1$
		}

		if (fileName.endsWith(".properties")) { // 判断传入的是否为properties文件 //$NON-NLS-1$
			this.p =  new Properties();
			try {
				this.p.load(this.getClass().getClassLoader().getResourceAsStream(fileName));
				this.getClass().getClassLoader().getResourceAsStream(fileName).close();
			} catch (IOException e) {
				logger.error("读取配置文件错误,请检查文件名" + ApplicationConfig.CONFIG_FILE_NAME, e); //$NON-NLS-1$
			} 
			
		} else {
			logger.error("读取properties文件失败, 传入的不是properties文件"); //$NON-NLS-1$
			throw new RuntimeException("请传入.properties文件"); //$NON-NLS-1$
		}
	}


	/**
	 * 根据key获取value
	 * @param key
	 * @return
	 */
	public String getProperty(String key) {
		
		if (this.p == null) {
			logger.error("未读取文件就开始获取key值错误"); //$NON-NLS-1$
			throw new RuntimeException("请调用 readPropertyFile(filename) 方法, 读入一个.properties文件"); //$NON-NLS-1$
		}
		
		String value = ""; //$NON-NLS-1$
		if (this.p.containsKey(key)) {
			value = this.p.getProperty(key);
		} else {
			throw new RuntimeException("key not fount in configuration file : " + key); //$NON-NLS-1$
		}
		return value;
	}
}
