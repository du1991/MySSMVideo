package ListenDemo;

import java.util.ArrayList;
import java.util.List;

public class K {
	private List<IDataListen> a=new ArrayList<IDataListen>();
	
	public void addListen(IDataListen iDataListen){
		a.add(iDataListen);
	}
	
	public void notifyLisen(){
		for(IDataListen w:a){
			w.update(null, null);
		}	
	}
	
	//前三个是关键
	public static void main(String[] args) {
		K k=new K();
		IDataListen p=new DataListen();
		k.addListen(p);
		k.targetFunc();
	}
	
	public void targetFunc(){
		notifyLisen();
		
		String str="sss";
		System.out.println("我是正常方法");
		
	}
	
}
