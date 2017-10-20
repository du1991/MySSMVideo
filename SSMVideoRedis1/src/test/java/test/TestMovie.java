package test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cm.duu.entity.Movie;
import cm.duu.entity.User;
import cm.duu.service.MovieService;
import cm.duu.service.UserService;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:mybatis-spring.xml"})
//多个配置文件格式：@ContextConfiguration(locations = {"classpath:mybatis-spring.xml","classpath:springDispatcherServlet.xml"})
public class TestMovie {
	
	@Autowired
	JedisConnectionFactory jedispool;
	
	@Test
	public void s(){
		Jedis nativeConnection = jedispool.getConnection().getNativeConnection();
        // 获取存储的数据并输出
		nativeConnection.lpush("sss", "dsdsd");
     
	}
		

	
	

}
