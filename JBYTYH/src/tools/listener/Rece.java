package tools.listener;

import java.net.DatagramPacket;
import java.net.DatagramSocket;

/**
 * @author: mulming
 * @ClassName: Rece
 * @date: 2019年2月17日 下午6:58:11
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
public class Rece implements Runnable {
	private DatagramSocket ds;
	
	public Rece(DatagramSocket ds) {
		this.ds=ds;
	}

	@Override
	public void run() {
		try {
			while(true) {
				//2、创建数据包
				byte[] buf=new byte[1024];
				DatagramPacket dp=new DatagramPacket(buf, buf.length);
				//3、使用接收方法将数据存储到数据包中. 必须明确一个端口号
				ds.receive(dp);
				//4、通过数据包对象的方法，解析其中的数据。
				String ip=dp.getAddress().getHostAddress();
				int port=dp.getPort();
				String text=new String(dp.getData(),0,dp.getLength());
				if(text.equals("886")) {
					System.out.println(ip+"退出聊天室 ");
				}
				System.out.println(ip+" "+port+"  "+text);
			}
		}catch (Exception e){}
	}

}
