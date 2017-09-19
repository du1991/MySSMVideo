package cm.duu.dao;

import java.util.List;

import cm.duu.entity.Content;

public interface ContentDao {
	
	//查询电影对应的所有评论
    public List<Content> queryByMovie(Integer  movieid);
    
    //提交评论 insert
    public  void addByText (Content  content);
    
    public Content queryOneForJustNow();
}
