package ListenDemo;

//实现一监听者
public class DataListen implements IDataListen {

	public void update(Object event, Object msg) {
		System.out.println("数据发生了变化");
	}

}
