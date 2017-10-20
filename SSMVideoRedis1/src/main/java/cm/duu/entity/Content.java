package cm.duu.entity;

import java.io.Serializable;

public class Content implements Serializable{
	
	private int id;
	private String username;
	private String moviename;
	private int movieid;
	private String content;
	private String contenttime;
	
	
	public String getContenttime() {
		return contenttime;
	}
	public void setContenttime(String contenttime) {
		this.contenttime = contenttime;
	}
	public int getMovieid() {
		return movieid;
	}
	public void setMovieid(int movieid) {
		this.movieid = movieid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
