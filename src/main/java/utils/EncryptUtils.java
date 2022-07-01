package utils;

import java.security.MessageDigest;

public class EncryptUtils {

	// 암호화 메서드
		public static String SHA256(String pw) {
			try{

				MessageDigest digest = MessageDigest.getInstance("SHA-256");
				byte[] hash = digest.digest(pw.getBytes("UTF-8"));
				StringBuffer hexString = new StringBuffer();

				for (int i = 0; i < hash.length; i++) {
					String hex = Integer.toHexString(0xff & hash[i]);
					if(hex.length() == 1) hexString.append('0');
					hexString.append(hex);
				}
				return hexString.toString();
				
			} catch(Exception ex){
				throw new RuntimeException(ex);
			}
		}
	}