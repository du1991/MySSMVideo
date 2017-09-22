package cm.duu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cm.duu.dao.UserDao;
import cm.duu.entity.Movie;
import cm.duu.entity.User;
import cm.duu.service.MovieService;
import cm.duu.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private MovieService movieService;

	// 主页跳转注册页面
	@RequestMapping("/regist1")
	public ModelAndView regist() {
		return new ModelAndView("regist", "username", userService.queryUser());
	}
	
	//ajax验证注册用户名
	@RequestMapping("/registValidate")
	@ResponseBody
	public Object registValidate(){	
		return new Gson().toJson(userService.queryUser()); 
	}
	
	// 注册插入用户
	@RequestMapping(value = "/doregist", method = RequestMethod.POST)
	public String registUserController(@ModelAttribute("user") User user) {
		userService.registUser(user.getUsername(), user.getPassword());
		return "redirect:registtransfer";
	}

	// 注册插入用户成功跳转中间页面
	@RequestMapping("/registtransfer")
	public String transfer() {
		return "registtransfer";
	}

	// 退出
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		userService.delSession(request.getSession());
		return "redirect:/home";
	}

	// 登录
	@RequestMapping("/login")
	@ResponseBody
	public Object login(@ModelAttribute("s") User user, HttpServletRequest request) {
		return new Gson().toJson(userService.queryUserByName(user, request.getSession()));
	}

	// 主页跳转到上传页面
	@RequestMapping("/upload")
	public String upload() {
		return "upload";
	}

	// 上传页面点击提交按钮
	@RequestMapping("/uploadfile")
	public ModelAndView upload(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			@ModelAttribute("movie") Movie movie) throws IOException {

		String fileName = file.getOriginalFilename();

		File dir = new File("/Users/rimi/tomcat9/webapps/uplo", fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		file.transferTo(dir);

		movie.setUsername(((User) (request.getSession().getAttribute("sessionuser"))).getUsername());
		movie.setMovieurl("../uplo/" + file.getOriginalFilename());
		movieService.addMovie(movie, request);
		return new ModelAndView("upload", "su", true);
	}

	// 上传页面跳转至我的上传
	@RequestMapping("/myUpload")
	public ModelAndView myUpload(HttpServletRequest request) {
		return new ModelAndView("myUpload", "movies",
				movieService.queryMoviesForUserUpload((User) (request.getSession().getAttribute("sessionuser"))));
	}

}
