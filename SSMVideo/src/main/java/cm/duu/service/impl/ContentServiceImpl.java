package cm.duu.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cm.duu.dao.ContentDao;
import cm.duu.entity.Content;
import cm.duu.service.ContentService;

@Service
public class ContentServiceImpl implements ContentService{
	
	@Autowired
	private	  ContentDao  contentdao;
	
	public Content queryOneForJustNow(){
		return contentdao.queryOneForJustNow();
	}
	
	
	public List<Content> queryByMovie(int movieid) {
		List<Content> li= contentdao.queryByMovie(movieid);
		return li;
	}


	public void addByText(Content content) {
		contentdao.addByText(content);
	}

}
