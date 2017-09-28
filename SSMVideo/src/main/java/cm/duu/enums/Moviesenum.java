package cm.duu.enums;

public enum Moviesenum {
	
	电影("movie"),体育("sport"),MV("MV"),TV("TV"),新闻("news");

	private String movieType;
	Moviesenum(String movieType){
		this.movieType=movieType;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	
}
