package com.thinkgem.jeesite.modules.front.frontUtils;

import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

public class PropertyListenter  implements ServletContextListener {
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub

    }

    public void contextInitialized(ServletContextEvent sce) {

        Properties properties = new Properties();
        InputStream in = null;
        String platsServerPath = "";
      
        ResourceLoader resourceLoader = new DefaultResourceLoader();
        try {
            Resource resource = resourceLoader.getResource("config.properties");
            in = resource.getInputStream();
            properties.load(in);
            platsServerPath = properties.get("platsServerPath").toString();
           /* servicefix = properties.get("servicefix").toString();
            imgprefix = properties.get("imgprefix").toString();
            managerTerminalIndexUrl = properties.get("managerTerminalIndexUrl").toString();
            companyTerminalServerUrl = properties.get("companyTerminalServerUrl").toString();*/
        }  catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(null != in) {
                    in.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        ServletContext sct=sce.getServletContext();
        sct.setAttribute("platsServerPath", platsServerPath);
       

    }
}
