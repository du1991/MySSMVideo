package cm.duu.service.impl;


import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cm.duu.dao.UserDao;
import cm.duu.entity.User;
import cm.duu.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	public Map<String,Object> queryUserByName(User user,HttpSession session) {
		Map<String,Object> map=new HashMap<String,Object>();
		 if(userDao.queryUserByName(user)!=null){
			 map.put("tr", true);		
			 session.setAttribute("user", userDao.queryUserByName(user));
			 map.put("user", userDao.queryUserByName(user).getUsername());
			 return map;
		 }
		 map.put("fa", false);
		 return map;
	}
	
	public void delSession(HttpSession session) {
		session.removeAttribute("user");
	}

}
