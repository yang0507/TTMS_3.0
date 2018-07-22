package cn.ttms.utils;

import java.util.UUID;

public class UploadUtils {
	public static String getRealName(String filename) {

		int index = filename.lastIndexOf("\\") + 1;

		return filename.substring(index);

	}

	// 获取随机名称 a.txt
	public static String getUUIDFileName(String filename) {
		int index = filename.lastIndexOf(".");
		if (index != -1) {

			return UUID.randomUUID() + filename.substring(index);
		} else {
			return UUID.randomUUID().toString();
		}
	}

	// 目录分离算法
	public static String getRandomDirectory(String filename) {

		 int hashcode = filename.hashCode();
	
	// int类型数据在内存中占32位。转换成16进制数，就得到8个16进制数
		String hex = Integer.toHexString(hashcode);
	
	 return "/" + hex.charAt(0) + "/" + hex.charAt(1);
	}

	
}
