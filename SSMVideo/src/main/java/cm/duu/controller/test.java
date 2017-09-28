package cm.duu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
	@RequestMapping("/s")
	public String s(){
		return "test";
	}
}
