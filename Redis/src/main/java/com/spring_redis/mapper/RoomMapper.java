package com.spring_redis.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring_redis.bean.Room;

/**
 * 
 * @author     cmy
 * @date     2016-10-22
 * @description 持久化
 */

public interface RoomMapper {

    @Insert("insert into room(roomName,address) values(#{roomName},#{addRess})")
    int insert(Room room);

    @Select("select * from room where id=#{id}")
    public Room selectByPrimaryKey(@Param("id")Integer id);

}
