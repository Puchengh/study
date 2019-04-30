/**  
* Title: Test.java  
* Description:   
* @author Puchen  
* @date 2019年4月29日 下午2:58:26  
* @version 1.0  
*/  
package com.puchen.java;

import java.lang.reflect.Field;

/**  
* <p>Title: Test</p>  
* <p>Description: </p>  
* @author puchen  
* @date 2019年4月29日  下午2:58:26
*/
public class Test {

	
	
	public static void main(String[] args) {
		
		try {
			
			
//			Field field = SampleClass.class.getField("sampleField");
//		      System.out.println(field.getType());
			Object a = 1;
//			dutyItemHandle.setOrgName("qwerqwer");
//			DbGrant dutyItemHandle =new DbGrant();
			String dutyItemHandle = new String();
			Field field = dutyItemHandle.getClass().getDeclaredField("heatMoney");
			field.setAccessible(true);
			System.out.println(field.getType().toString());
			//class java.lang.Long
			if(field.getType().toString().substring(16).equals("Long")) {
				System.out.println("6786789");
			}
			System.out.println(field.getType().toString().substring(16));
			field.set(dutyItemHandle,field.getType().toString().substring(16).getClass().cast(a));
			System.out.println("----------------------");
			System.out.println(dutyItemHandle.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
