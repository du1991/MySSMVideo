package cm.duu.dao;

import java.util.List;

import cm.duu.entity.Movie;
import cm.duu.entity.User;

public interface MovieDao {

	public void addMovie(Movie movie);
	public List<Movie> queryMovies(Movie movie);
	
	public List<Movie> queryMoviesForUserUpload(User user);
	
	//下面量方法查询分页
	public int queryByType(Movie movie); 
	public List<Movie> queryMoviesByPage(String movietypedetail,int start,int num);
	
	//查找
	public List<Movie> queryMoivesForSearch(String keyWords);
	
	
}
