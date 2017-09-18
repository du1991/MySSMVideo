package test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cm.duu.entity.Movie;
import cm.duu.entity.User;
import cm.duu.service.MovieService;
import cm.duu.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:mybatis-spring.xml"})
//多个配置文件格式：@ContextConfiguration(locations = {"classpath:mybatis-spring.xml","classpath:springDispatcherServlet.xml"})
public class TestMovie {
	
	@Autowired
	private MovieService movieService;
	
	@Test
	public void addMovie(){
		User a=new User();
		a.setUsername("tom");
		List<Movie> queryMoviesForUserUpload = movieService.queryMoviesForUserUpload(a);
		queryMoviesForUserUpload.forEach(x->System.out.println(x));
		
		
		

	}
	

}
