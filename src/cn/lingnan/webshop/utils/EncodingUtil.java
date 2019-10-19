package cn.lingnan.webshop.utils;

import java.io.UnsupportedEncodingException;

/**
 * 处理get请求方式乱码问题
 * @author Lenovo
 *
 */
public class EncodingUtil {
	
	public static String convertEncoding(String param) {
		if (isEmpty(param)) {
			return "";
		}else {			
			try {
				return new String(param.getBytes("ISO8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return "";
			}
		}
	}
	
	public static boolean isEmpty(String param) {
		return param==null || "".equals(param.trim());
	}
	
}
