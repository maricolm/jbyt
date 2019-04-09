package com.jb.pojo;

/**
 * @author: mulming
 * @ClassName: Temp
 * @date: 2018年9月7日 下午3:12:13
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
public class Temp {
	private String id;
	private String key;
	private String data;
	
	/**
	 * @param id
	 * @param key
	 * @param data
	 */
	public Temp(String id, String key, String data) {
		super();
		this.id = id;
		this.key = key;
		this.data = data;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}

}
