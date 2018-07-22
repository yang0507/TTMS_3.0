package cn.ttms.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
	
	public static String md5Code(String password) {
		byte[] secretBytes = null;//byte数组
		try {
			secretBytes = MessageDigest.getInstance("md5").digest(password.getBytes());//调用md5 方法进行加密
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("没有md5这个算法");
		}
		 // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值 
		String md5Code = new BigInteger(1,secretBytes).toString(16);
		//若加密后hash值长度不足32位 则以0在字符串前占位
		for(int i=0;i<32-md5Code.length();i++){
			md5Code = "0"+md5Code;
		}
		//输出加密后的hash值
		return md5Code;
	}
	
}
