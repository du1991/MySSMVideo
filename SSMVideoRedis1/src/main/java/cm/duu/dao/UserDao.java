package cm.duu.dao;

import java.util.List;

import cm.duu.entity.User;

public interface UserDao {
	public User queryUserByName(User user);

	public void insertUser(User user);

	public List<User> queryUser();
}
