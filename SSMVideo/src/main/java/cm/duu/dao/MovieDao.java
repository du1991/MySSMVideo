package cm.duu.dao;

import java.util.List;

import cm.duu.entity.Movie;

public interface MovieDao {

	public void addMovie(Movie movie);
	public List<Movie> queryMovies(Movie movie);
	
	//下面量方法查询分页
	public int queryByType(Movie movie); 
	public List<Movie> queryMoviesByPage(String movietypedetail,int start,int num);
	
	
}
