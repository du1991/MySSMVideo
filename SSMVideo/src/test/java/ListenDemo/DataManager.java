package ListenDemo;

import java.util.ArrayList;
import java.util.List;

//被监听者
public class DataManager {
	private List<IDataListen> listenList = new ArrayList<>();

	public void notifyListen(Object event, Object msg) {
		for (IDataListen dataListen : listenList) {
			dataListen.update(null, null);
		}
	}

	public void addListen(IDataListen dataListen) {
		listenList.add(dataListen);
	}

	public void updateData(Object msg) {
		this.notifyListen(null, msg);
	}

	public static void main(String[] args) {
		DataManager dataManager = new DataManager();
		IDataListen dataListen1 = new DataListen();
		IDataListen dataListen2 = new DataListen();
		dataManager.addListen(dataListen1);
		dataManager.addListen(dataListen2);
		dataManager.updateData("aaa");
		dataManager.updateData("sss");
	}
}
