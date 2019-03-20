package com.jianli.search01;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
public class ConfigUtil {
   public static String getValue(String key){
	   Properties pro= new Properties();
	 //得到文件输入流  ,getResourceAsStream查找具有给定名称的资源java.lang包里的 class
	  InputStream ia=ConfigUtil.class.getResourceAsStream("/jdbc.properties");
	   
	   try {
		pro.load(ia);
		return pro.getProperty(key);
	} catch (IOException e) {
		throw new RuntimeException();
	}
	   
   }
}
