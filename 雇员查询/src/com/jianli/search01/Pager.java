package com.jianli.search01;

public class Pager {
/*
 * ��ҳ
 */
	private long total;


	public long getTotal() {
		return total;
	}


	public void setTotal(long total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return "Pager [total=" + total + "]";
	}
	
}
