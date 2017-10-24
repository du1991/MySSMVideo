package cm.duu.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cm.duu.entity.Movie;
import cm.duu.entity.User;

public interface MovieService {
	
	public void addMovie(Movie movie,HttpServletRequest request);
	public Map<String,List<Movie>> queryMovies(List<Movie> movietypes);
	public List<Movie> queryByType(Movie movie);
	public Map<String,Object> queryMoviesByPage(Movie movie,int nowpage);
	public List<Movie> queryMoivesForSearch(String keyWords);
	public List<Movie> queryMoviesForUserUpload(User user);
	public List<Movie> queryMoviesForUserUploadLimitFive(User user);
	
	
	
	

}
