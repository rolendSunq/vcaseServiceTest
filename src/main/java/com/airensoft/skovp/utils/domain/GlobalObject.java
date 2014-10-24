/**
 * 
 */
package com.airensoft.skovp.utils.domain;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 * @author Hyun Jun Jang
 * 
 */
public class GlobalObject {
	private final static String PROPERTIES_NAME = "ovpMams.properties";
	private static GlobalObject instance;
	private String currentPath;
	private String rootPath;
	private Properties properties;

	private GlobalObject() {
		currentPath = "";
		properties = null;
	}

	public static GlobalObject getInstance() {
		// DCL
		if (instance == null) {
			synchronized (GlobalObject.class) {
				if (instance == null) {
					instance = new GlobalObject();
				}
			}
		}

		return instance;
	}

	public String getCurrentPath() {
		return currentPath;
	}

	public void setCurrentPath(String currentPath) {
		this.currentPath = currentPath;
	}

	public String getProperty(String key) {
		return getProperty(key, "");
	}

	public String getProperty(String key, String defaultValue) {
		if (currentPath.equals("") == true) {
			return "";
		}

		if (properties == null) {
			loadProperties();
		}

		String value;

		value = properties.getProperty(key);

		if (value == null) {
			return defaultValue;
		}

		return value;
	}

	public String getRootPath() {
		return rootPath;
	}

	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}

	private void loadProperties() {
		properties = new Properties();

		FileInputStream fis = null;
		
		//D:\Project\HankookTire\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mams\WEB-INF\classes\META-INF\properties
		String propertiesPath = getCurrentPath() + File.separator + 
				"WEB-INF" + File.separator + "classes" + File.separator + 
				"META-INF" + File.separator + "properties" + File.separator + PROPERTIES_NAME;
		try {
			fis = new FileInputStream(propertiesPath);
			properties.load(fis);

		} catch (FileNotFoundException e) {
			System.out.println("properties 파일을 찾을수 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("properties 파일에 오류가 발생했습니다.");
			e.printStackTrace();
		} finally {
			try {fis.close();} catch (IOException e1) {e1.printStackTrace();}
		}
	}
}
