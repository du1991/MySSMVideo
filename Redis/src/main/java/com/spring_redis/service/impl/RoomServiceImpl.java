package com.spring_redis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring_redis.bean.Room;
import com.spring_redis.mapper.RoomMapper;
import com.spring_redis.service.RoomService;

public class RoomServiceImpl implements RoomService{

    @Autowired
    private RoomMapper mapper;
    
    public int insert(Room room) throws Exception {
        
        return mapper.insert(room);
    }

    public Room selectByPrimaryKey(Integer id) throws Exception {
        
        return mapper.selectByPrimaryKey(id);
    }}
