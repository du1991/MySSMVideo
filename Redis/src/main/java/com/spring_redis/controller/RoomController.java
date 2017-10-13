package com.spring_redis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_redis.cache.GetCache;
import com.spring_redis.service.RoomService;

/**
 * 
 * @author     cmy
 * @date     2016-10-22
 * @description test controller
 */

@Controller
@RequestMapping("room")
public class RoomController {

    @Autowired
    private RoomService  roomService;
    
    final int roomnumber=2;
    
    @GetCache(name="room",value="id")
    @RequestMapping("selectByPrimaryKey")
    public String  roomList(Integer id) throws Exception{  
    		System.out.println("===========controller");
        System.out.println("从数据库已查询到数据，准备缓存到redis...  "+roomService.selectByPrimaryKey(roomnumber).getRoomName());
         System.out.println(roomService.selectByPrimaryKey(roomnumber).getRoomName());
         System.out.println("===========controller");
         return "index";
    }
    

}
