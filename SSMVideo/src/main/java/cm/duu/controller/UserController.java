package cm.duu.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import cm.duu.entity.User;
import cm.duu.service.MovieService;
import cm.duu.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		userService.delSession(request.getSession());
		return "redirect:/home";
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public Object login(@ModelAttribute("s") User user,
			HttpServletRequest request){
		return new Gson().toJson(userService.queryUserByName(user,request.getSession()));
	}
	
	@RequestMapping("/upload")
	public String upload(){
		return "upload";
	}
	
	@RequestMapping("/uploadfile")  
	public String upload(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IOException{  
        String path = request.getSession().getServletContext().getRealPath("upload");  
        System.out.println(path);
        String fileName = file.getOriginalFilename(); 
        System.out.println(fileName);
        File dir = new File(path,fileName);          
        if(!dir.exists()){  
            dir.mkdirs();  
        }  
        file.transferTo(dir);  
        return "ko";  
    }  
	
	
}
