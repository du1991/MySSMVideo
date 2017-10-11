package cm.duu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cm.duu.entity.Movie;

@Controller
public class test {
	@RequestMapping("/s")
	public String s(){
		return "test";
	}
	
	@RequestMapping("/ss")
	@ResponseBody
	public String ss(@ModelAttribute("movie") Movie movie){
		System.out.println(movie.getMoviename());
		 return "1";
		 
		 
	}
}
