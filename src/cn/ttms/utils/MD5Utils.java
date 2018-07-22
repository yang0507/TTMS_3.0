package cn.ttms.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
	
	public static String md5Code(String password) {
		byte[] secretBytes = null;//byte����
		try {
			secretBytes = MessageDigest.getInstance("md5").digest(password.getBytes());//����md5 �������м���
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("û��md5����㷨");
		}
		 // BigInteger������8λ���ַ���ת����16λhexֵ�����ַ�������ʾ���õ��ַ�����ʽ��hashֵ 
		String md5Code = new BigInteger(1,secretBytes).toString(16);
		//�����ܺ�hashֵ���Ȳ���32λ ����0���ַ���ǰռλ
		for(int i=0;i<32-md5Code.length();i++){
			md5Code = "0"+md5Code;
		}
		//������ܺ��hashֵ
		return md5Code;
	}
	
}
