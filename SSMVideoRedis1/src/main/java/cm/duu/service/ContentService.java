package cm.duu.service;

import java.util.List;
import java.util.Map;

import cm.duu.entity.Content;


public interface ContentService {
	public List<Content> queryByMovie(int movieid);
	public Content queryOneForJustNow();
	public void addByText(Content co) ; 
	public Map<String,Object> queryByContent(int movieid,int Contpage);
	public int queryByContentpage(int movieid);
}
