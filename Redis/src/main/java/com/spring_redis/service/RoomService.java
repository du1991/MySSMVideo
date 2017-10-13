package com.spring_redis.service;

import com.spring_redis.bean.Room;

/**
 * 
 * @author cmy
 * @date 2016-10-22
 * @description test
 */
public interface RoomService {

	int insert(Room room) throws Exception;

	Room selectByPrimaryKey(Integer id) throws Exception;

}

// 实现
/**
 * @author cmy
 * @date 2016-10-22
 * @description test 实现
 */
