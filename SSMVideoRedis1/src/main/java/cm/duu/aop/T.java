package cm.duu.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

import cm.duu.util.SerializeUtil;
import redis.clients.jedis.Jedis;

public class T {
	@Autowired
	private JedisConnectionFactory jedisConnectionFactory;

	// 包名+ 类名 + 方法名 + 参数(多个) 生成Key
	public static String getRedisKey(ProceedingJoinPoint pjp) {
		StringBuilder key = new StringBuilder();
		String packageAndClassName = pjp.getTarget().getClass().getName();
		key.append(packageAndClassName);
		String methodName = pjp.getSignature().getName();
		key.append(".").append(methodName);
		Object[] args = pjp.getArgs();
		for (Object arg : args) {
			key.append(".").append(arg);
		}
		return key.toString();
	}

	public Object doAround(ProceedingJoinPoint pjp) throws Throwable {

		Jedis jedis = jedisConnectionFactory.getConnection().getNativeConnection();
		String queryKey = getRedisKey(pjp);
		byte[] queryFromRedis = jedis.get(queryKey.getBytes());
		System.out.println("我们认为应该出现map" + queryFromRedis);
		if (queryFromRedis != null) {
			System.out.println("redis里面有数据");
			return SerializeUtil.unserizlize(queryFromRedis);
		} else {
			System.out.println("redis里面没有有数据！！！！！");
			Object queryDataFromMysql = pjp.proceed();
			jedis.set(queryKey.getBytes(), SerializeUtil.serialize(queryDataFromMysql));
			return queryDataFromMysql;
		}
	}
	
	public void doafter(){
		Jedis jedis = jedisConnectionFactory.getConnection().getNativeConnection();
		jedis.flushAll();
	}

}
