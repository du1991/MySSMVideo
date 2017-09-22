package cm.duu.service.impl;

import java.util.HashMap;
import java.util.List;
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
	
	//登录
	public Map<String, Object> queryUserByName(User user, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userDao.queryUserByName(user) != null) {
			map.put("tr", true);
			session.setAttribute("sessionuser", userDao.queryUserByName(user));
			session.setMaxInactiveInterval(30*60);
			map.put("user", userDao.queryUserByName(user).getUsername());
			return map;
		}
		map.put("fa", false);
		return map;
	}
	
	//退出删除session
	public void delSession(HttpSession session) {
		session.removeAttribute("sessionuser");
	}
	
	//注册插入用户
	public void registUser(String username, String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		userDao.insertUser(user);
	}
	
	//查询所有用户返回list集合
	public List<User> queryUser() {
		List<User> list = userDao.queryUser();
		return list;
	}

}
