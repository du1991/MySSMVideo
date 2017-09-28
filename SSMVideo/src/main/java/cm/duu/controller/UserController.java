package cm.duu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import cm.duu.constant.LIstMovieType;
import cm.duu.constant.UploadConstant;
import cm.duu.constant.UploadProgressSave;
import cm.duu.dao.UserDao;
import cm.duu.entity.Movie;
import cm.duu.entity.User;
import cm.duu.enums.Moviesenum;
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
	//为什么传参数ss-->因为上传页面的提交按钮的controller（'uploadfile'）需要跳转 controller（upload）
	//所以，进controller（upload），有两个地方：1.主页上传 2.下面的controller层，起到一个区分的作用
	@RequestMapping("/upload")
	public ModelAndView upload(@RequestParam("ss") String ss) {
		ModelAndView mode=new ModelAndView();
		if(ss!=null){
			mode.addObject("success", ss);
		}
		mode.addObject("upload");
		return mode;
	}
	
	//上传页面文件浏览结束 将视频上传服务器并写入数据库
	@RequestMapping(value="/uploadfile")
	public String uploadfile(@RequestParam("file") MultipartFile file,HttpServletRequest request,@ModelAttribute("movie") Movie movie) throws IOException{
		InputStream inputStream = file.getInputStream();
		System.out.println(file.getOriginalFilename());
        FileOutputStream fos = new FileOutputStream(UploadConstant.UPLOADPATH+file.getOriginalFilename());
        int count=1;//计数器
        long uploaded=0;//以上传的大小
        byte[] buf = new byte[1024];
        int len = 0;
        request.getSession().setAttribute("totalSize", file.getSize());
        while ((len = inputStream.read(buf)) != -1) { 
        		if(len==1024){      	
        		     uploaded+=count*1024;
        		}
        		else{
        			uploaded+=len;
        		}
        		 request.getSession().setAttribute("uploaded", uploaded);
        		fos.write(buf, 0, len);  
        }
        request.getSession().removeAttribute("totalSize");
        request.getSession().removeAttribute("uploaded");
        fos.close();
        //写入数据库
        movie.setUsername(((User) (request.getSession().getAttribute("sessionuser"))).getUsername());
		movie.setMovieurl( UploadConstant.UPLOAMYSQLDPATH+ movie.getMoviename());
		movie.setMovietypehead(LIstMovieType.MOVIEtyphead[Integer.parseInt(movie.getMovietypehead())]);
		System.out.println(movie.getIntroduction());;
		movieService.addMovie(movie, request);
        return "redirect:upload?ss=1";
	}
	
	//进度状态查看
	@RequestMapping("/UploadProgressHandle")
	@ResponseBody
	public Object UploadProgressHandle(HttpServletRequest request){
		Map<String,Object> map=new HashMap<>();
		if(request.getSession().getAttribute("uploaded")!=null&&request.getSession().getAttribute("totalSize")!=null)
		{
		map.put("progress", request.getSession().getAttribute("uploaded"));
		map.put("totalSize", request.getSession().getAttribute("totalSize"));
		}
		else{
			map.put("progress", 0);
			map.put("totalSize", 1);
		}
		return new Gson().toJson(map);
	}

	// 上传页面跳转至我的上传
	@RequestMapping("/myUpload")
	public ModelAndView myUpload(HttpServletRequest request) {
		return new ModelAndView("myUpload", "movies",
				movieService.queryMoviesForUserUpload((User) (request.getSession().getAttribute("sessionuser"))));
	}

}
