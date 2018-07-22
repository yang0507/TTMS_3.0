package cn.ttms.utils;

import java.util.UUID;

public class UploadUtils {
	public static String getRealName(String filename) {

		int index = filename.lastIndexOf("\\") + 1;

		return filename.substring(index);

	}

	// ��ȡ������� a.txt
	public static String getUUIDFileName(String filename) {
		int index = filename.lastIndexOf(".");
		if (index != -1) {

			return UUID.randomUUID() + filename.substring(index);
		} else {
			return UUID.randomUUID().toString();
		}
	}

	// Ŀ¼�����㷨
	public static String getRandomDirectory(String filename) {

		 int hashcode = filename.hashCode();
	
	// int�����������ڴ���ռ32λ��ת����16���������͵õ�8��16������
		String hex = Integer.toHexString(hashcode);
	
	 return "/" + hex.charAt(0) + "/" + hex.charAt(1);
	}

	
}
