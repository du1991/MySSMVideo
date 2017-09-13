package cm.duu.entity;

public class Movie {
	
	private int id;
	private String moviename;
	private String movieurl;
	private String runningtime;
	private String moviepicture;
	private String introduction;
	private String publisher;
	private String movietypehead;
	private String movietypedetail;
	private String publishtime;
	
	public Movie(){}
	public Movie(String movietypedetail) {
		this.movietypedetail = movietypedetail;
	}
	
	public String getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public String getMoviepicture() {
		return moviepicture;
	}
	public void setMoviepicture(String moviepicture) {
		this.moviepicture = moviepicture;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getMovietypehead() {
		return movietypehead;
	}
	public void setMovietypehead(String movietypehead) {
		this.movietypehead = movietypehead;
	}
	public String getMovietypedetail() {
		return movietypedetail;
	}
	public void setMovietypedetail(String movietypedetail) {
		this.movietypedetail = movietypedetail;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public String getMovieurl() {
		return movieurl;
	}
	public void setMovieurl(String movieurl) {
		this.movieurl = movieurl;
	}
	@Override
	public String toString() {
		return "Movie [id=" + id + ", moviename=" + moviename + ", movieurl=" + movieurl + "]";
	}
	
	
	
}
