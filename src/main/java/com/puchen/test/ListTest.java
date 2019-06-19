package com.puchen.test;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: study
 * @description: 测试
 * @author: Puchen
 * @create: 2019-06-10 10:03
 */
public class ListTest {

    public static void main(String[] args) {


        List<User> userList = new ArrayList<User>();
        User user = new User();
        user.setId(12341L);
        user.setPassword("1234");
        userList.add(user);

        User user1 = new User();
        user1.setId(12341232L);
        user1.setPassword("1234");
        userList.add(user1);

        User user2 = new User();
        user2.setId(123421343L);
        user2.setPassword("1234");
        userList.add(user2);

        for (User userOne : userList
             ) {
            userOne.setUserName("puchen");
        }

        System.out.println(userList.toString());
    }
}
