package cm.duu.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import cm.duu.entity.Content;
import cm.duu.entity.User;
import cm.duu.service.ContentService;

@Controller
public class ContentController {
	@Autowired
	private ContentService contentService;
	
	//用户评论 提交 按钮--insert
	@RequestMapping("/ContentController")
	   @ResponseBody
	   public Object  addByText( @ModelAttribute("content")  Content content,HttpServletRequest request){	 
		   content.setUsername(((User)(request.getSession().getAttribute("sessionuser"))).getUsername());
		   contentService.addByText(content);
	     	return new Gson().toJson(contentService.queryOneForJustNow());
	     }
	
	//评论分页
	@RequestMapping(value="/ajaxContent",produces = "text/html;charset=UTF-8;")
	@ResponseBody
	public Object  showContent(@ModelAttribute("movieid")  Content movie,@RequestParam("page") Integer  Contpage){
		return new Gson().toJson(contentService.queryByContent(movie.getMovieid(), Contpage));
	}
}
