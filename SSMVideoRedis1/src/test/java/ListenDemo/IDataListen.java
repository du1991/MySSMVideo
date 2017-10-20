package ListenDemo;

//我们先定义一个接口，可以让多个监听者实现
public interface IDataListen {
	public void update(Object event,Object msg);
}
