package cm.duu.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public Map<String,Object> queryByContent(int movieid,int Contpage) {
		  Map<String ,Object> map=new HashMap<String ,Object>(); 
		  int count = contentdao.queryByContentpage(movieid);
		  int pages;// 总页数
		  if(count % 10==0){// 计算总页数,总记录数和每页显示的数
			  pages = count / 10; // 对总页数赋值
		  }else{
			  pages  = count /10 +1;
		  }
		  if(Contpage < 1  ){
			  Contpage=1;
		  }
		  if( Contpage > pages){
			  Contpage=pages;
		  }
		  map.put("pages", pages);
		  map.put("count", count);
		 
		   
		    for(int i=1; i<=pages; i++){
		    	if(i==Contpage){
		    		map.put("mappingContent", contentdao.queryByContent(movieid,(i-1)*10,10));
		    		map.put("Contpage", i);		    	
		    	}
		    }
	return  map;
	
	}

	
	public int queryByContentpage(int movieid) {
		return   contentdao.queryByContentpage(movieid);
		
	}
	

}
