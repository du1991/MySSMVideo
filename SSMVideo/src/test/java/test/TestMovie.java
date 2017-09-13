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
		List<Movie> listMovie=new ArrayList<Movie>();
		listMovie.add(new Movie("hot"));
		listMovie.add(new Movie("comedy"));
//		listMovie.add(new Movie("科幻"));
//		listMovie.add(new Movie("体育"));
		Map<String,List<Movie>> a=movieService.queryMovies(listMovie);
		a.forEach((x,y)->System.out.println(x));
//		a.get("comedy1").forEach(p->System.out.println(p));

	}
	

}
