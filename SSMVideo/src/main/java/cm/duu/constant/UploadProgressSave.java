package cm.duu.constant;

import java.util.Hashtable;

public class UploadProgressSave {
	
	//为了防止多用户并发，使用线程安全的Hashtable
	private static Hashtable<String, Object> table = new Hashtable<>();

	public static void put(String key, Object value) {
		table.put(key, value);
		
		
		
		
	}
	
	public static Object get(String key){
		
	        return table.get(key);
	        
	}
	
	public static Object remove(String key) {
		return table.remove(key);
	}
}
