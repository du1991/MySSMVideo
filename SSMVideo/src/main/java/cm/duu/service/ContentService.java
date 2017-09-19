package cm.duu.service;

import java.util.List;

import cm.duu.entity.Content;

public interface ContentService {
	public List<Content> queryByMovie(int movieid);
	public Content queryOneForJustNow();
	public void addByText(Content co) ; 
}
