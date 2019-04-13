package com.puchen.java;

public class IpToInteger {

	
	public static int ipToInteger(String ip){
		String[] ips = ip.split("\\.");
		int ipFour = 0;
		//因为每个位置最大255，刚好在2进制里表示8位
		for(String ip4: ips){
			Integer ip4a = Integer.parseInt(ip4);
			//这里应该用+也可以,但是位运算更快
			ipFour = (ipFour << 8) | ip4a;
		}
		return ipFour;
	}

	
	public static void main(String[] args) {
		System.out.println(ipToInteger("192.168.31.201"));
	}
	
}
