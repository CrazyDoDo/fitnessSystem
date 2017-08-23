package cn.fitnessmanage.tools;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigManage {
	
	private static ConfigManage configManage;
	private static Properties properties;
	//˽�й�����-��ȡ�����ļ�
	private ConfigManage(){
		String configFile="database.properties";
		properties=new Properties();
		InputStream is=ConfigManage.class.getClassLoader().getResourceAsStream(configFile);
		try {
			properties.load(is);
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	//ȫ�ַ��ʵ�
	public static ConfigManage getInstance(){
		if(configManage==null){
			configManage=new ConfigManage();
		}
			return configManage;
		
	}
	//��ݴ���ļ����ֵ
	public String getValue(String key){
		return properties.getProperty(key);
	}

}
