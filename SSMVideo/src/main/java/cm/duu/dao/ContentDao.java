package cm.duu.dao;

import java.util.List;

import cm.duu.entity.Content;

public interface ContentDao {
	
	//查询电影对应的所有评论
	public int  queryByContentpage(int  movieid);
	
	
    public List<Content> queryByMovie(int  movieid );
   //  public   List<Content>   queryByContent( Integer  movieid,int start,int end);
    
    public   List<Content>   queryByContent ( Integer  movieid,int start, int size);
    //提交评论 insert
    public  void addByText (Content  content);
    
    public Content queryOneForJustNow();
}
