package cm.duu.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SerializeUtil {

	// 序列化
	public static byte[] serialize(Object obj) throws IOException {
		ByteArrayOutputStream bai = new ByteArrayOutputStream();
		ObjectOutputStream obi = new ObjectOutputStream(bai);
		obi.writeObject(obj);
		byte[] byt = bai.toByteArray();
		return byt;
	}

	// 反序列化
	public static Object unserizlize(byte[] byt) throws IOException, ClassNotFoundException {
		ByteArrayInputStream bis = new ByteArrayInputStream(byt);
		ObjectInputStream oii = new ObjectInputStream(bis);
		Object obj = oii.readObject();
		return obj;
	}

}
