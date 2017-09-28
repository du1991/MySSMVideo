//package cm.duu.listener;
//
//import javax.servlet.annotation.WebListener;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSessionAttributeListener;
//import javax.servlet.http.HttpSessionBindingEvent;
//import javax.servlet.http.HttpSessionEvent;
//import javax.servlet.http.HttpSessionListener;
//
//import cm.duu.constant.UserSession;
//import cm.duu.entity.User;
//
//
//
//@WebListener
//public class UserListener implements HttpSessionListener, HttpSessionAttributeListener {
//  
//	//map中去掉存储的session 键值对（username+session）
//    public void sessionDestroyed(HttpSessionEvent se)  { 
//    	User u = (User) se.getSession().getAttribute("sessionuser");
//    	UserSession.USERSESSION.remove(u.getUsername());
//    }
//    
//    //如果值存在，说明之前已经登录，则去掉以前的session中的 属性
//    public void attributeAdded(HttpSessionBindingEvent se)  { 
//    		if(se.getName().equals("sessionuser")){
//    		HttpSession sess= UserSession.USERSESSION.remove(((User)se.getValue()).getUsername());
//    		//map中remove 时，会返回 该键值对中的 值 
//    		//如果值存在，说明之前已经登录，则去掉以前的session中的 属性
//    		
//    		UserSession.USERSESSION.put(((User)se.getValue()).getUsername(),se.getSession() );
//    		if(sess!=null){
//    			sess.removeAttribute("sessionuser");
//    		}    		
//    	}
//    }
//
//}
