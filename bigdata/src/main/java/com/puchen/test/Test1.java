/**  
* Title: Test1.java  
* Description:   
* @author Puchen  
* @date 2019年3月26日 上午10:01:28  
* @version 1.0  
*/  
package com.puchen.test;

/**  
* <p>Title: Test1</p>  
* <p>Description: </p>  
* @author puchen  
* @date 2019年3月26日  上午10:01:28
*/
public class Test1 {
	  public static String sort(String str){
         //利用toCharArray可将字符串转换为char型的数组
         char[] s1 = str.toCharArray();
         for(int i=0;i<s1.length;i++){
             for(int j=0;j<i;j++){
                 if(s1[i]<s1[j]){
                     char temp = s1[i];
                     s1[i] = s1[j];
                     s1[j] = temp;
                 }
             }
         }
         //再次将字符数组转换为字符串，也可以直接利用String.valueOf(s1)转换
         String st = new String(s1);
         return st;
	  }
	  
	  //排序函数
		public static void sort_str(String[] str) {
			for(int i=0;i<str.length-1;i++) {
				for(int j=i+1;j<str.length;j++) {
					if(str[i].compareTo(str[j])>0)
						swap(str,i,j);
				}
			}
			
			for (int i = 0; i < str.length; i++) {
				System.out.println(str[i]);
			}
		}
		//交换函数
		public static void swap(String[] str,int i,int j) {
			String s=str[i];
			str[i]=str[j];
			str[j]=s;
		}
	
	  public static void main(String[] args) {
		  
//		  	String str1 = "abc";
//			String str2 = "def";
//			String str3 = "afc";
//			String str4 = "faa";
//			String str5 = "agbc";
//			String str6 = "defs";
//			String str7 = "afc";
//			String str8 = "facc";
//			String str9 = "sff";
//			
//			String[] strSortIn = new String[9];
//			String[] str = {str1,str2,str3,str4,str5,str6,str7,str8,str9};	
//			for (int i = 0; i < str.length; i++) {
//				strSortIn[i] = sort(str[i]);
//			}
//			sort_str(strSortIn);
		  char a = 'a';
		  char b = 'b';
		  if(a>b) {
			System.out.println("a>b");  
		  }
		  if(a<b) {
			System.out.println("a<b");  
		  }
	}
	  
}
