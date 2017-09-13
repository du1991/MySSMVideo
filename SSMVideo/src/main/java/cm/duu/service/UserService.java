package cm.duu.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cm.duu.entity.User;

public interface UserService {
	
	public Map<String,Object> queryUserByName(User user,HttpSession session);
	public void delSession(HttpSession session);
}
