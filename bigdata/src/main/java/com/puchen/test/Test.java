/**  
* Title: package-info.java  
* Description:   
* @author Puchen  
* @date 2019年3月24日 下午12:19:22  
* @version 1.0  
*/
/**  
* <p>Title: package-info</p>  
* <p>Description: </p>  
* @author puchen  
* @date 2019年3月24日  下午12:19:22
*/
package com.puchen.test;

import java.util.ArrayList;
import java.util.List;

public class Test{
	
	
	
	 public static void change(int c) {
		 c = c + 9 ;
		 System.out.println(c);
	 }
	
	 public static void main(String[] args) {
//		 int a = 9;
//		 System.out.println(a);
//		 change(a);
//		 
//		 System.out.println(a);
		 
		 List<Object> list = new ArrayList<Object>();
		 list.add("12344");
		 list.add("12345");
		 list.add("12346");
		 list.add("12347");
		 
		 List<Object> list2 = new ArrayList<Object>();
		 list2.addAll(list);
		 
		 list2.remove("12344");
		 
		 System.out.println(list);
		 System.out.println(list2);
		 
		 List<Object> list3 = new ArrayList<Object>();
		 list3 = list;
		 list3.remove("12344");
		 
		 System.out.println(list);
		 System.out.println(list3);
		 
		 
	}
	
}