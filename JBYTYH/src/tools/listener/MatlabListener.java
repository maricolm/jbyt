package tools.listener;

import java.io.File;
import java.net.DatagramPacket;
import java.net.DatagramSocket;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import matlabcontrol.MatlabConnectionException;
import matlabcontrol.MatlabProxy;
import matlabcontrol.MatlabProxyFactory;
import matlabcontrol.MatlabProxyFactoryOptions;


public class MatlabListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public MatlabListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce) {
    	/*
    	File file = new File("c:\\mfile");
    	//File file = new File("/Users/mulming/code/all_Java/JBYTYH");
    	MatlabProxyFactoryOptions options = new MatlabProxyFactoryOptions.Builder()
    	.setProxyTimeout(300000L)
    	.setMatlabStartingDirectory(file)//设置MATLAB的开始目录。
    	.setHidden(false)
    	.build();
    	MatlabProxyFactory factory = new MatlabProxyFactory(options);
    	MatlabProxy proxy = null;
    	try {
    		proxy = factory.getProxy();
    	}catch (MatlabConnectionException e) {
    		e.printStackTrace();
    	}
    	sce.getServletContext().setAttribute("proxy", proxy); */
    	
    }
	
}
