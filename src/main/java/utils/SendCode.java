package utils;

import java.util.Random;


// 메일 전송 클래스
public class SendCode {

	public static int getCode() {
		
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int letter = 7;
		String resultNum = "";
		
		for(int i=0; i<letter; i++) {
			
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resultNum += ranNum;
			
			
		}
		
		return Integer.parseInt(resultNum);
		
	}
}
