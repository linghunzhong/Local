package com.jianli.search01;

public class EMP {
	private int Id ;
	private int POST_TYPE; 
    private String EMP_NAME;
    private int EMP_SEX ;
    private int EMP_AGE;
    private String  EMP_DEPART;
    private int EMP_YRAR;
    
    public EMP(){}
	public EMP(int Id,int pOST_TYPE, String eMP_NAME, int eMP_SEX, int eMP_AGE, String eMP_DEPART, int eMP_YRAR) {
		Id=Id;
		POST_TYPE = pOST_TYPE;
		EMP_NAME = eMP_NAME;
		EMP_SEX = eMP_SEX;
		EMP_AGE = eMP_AGE;
		EMP_DEPART = eMP_DEPART;
		EMP_YRAR = eMP_YRAR;
	}
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getPOST_TYPE() {
		return POST_TYPE;
	}
	public void setPOST_TYPE(int pOST_TYPE) {
		POST_TYPE = pOST_TYPE;
	}
	public String getEMP_NAME() {
		return EMP_NAME;
	}
	public void setEMP_NAME(String eMP_NAME) {
		EMP_NAME = eMP_NAME;
	}
	public int getEMP_SEX() {
		return EMP_SEX;
	}
	public void setEMP_SEX(int eMP_SEX) {
		EMP_SEX = eMP_SEX;
	}
	public int getEMP_AGE() {
		return EMP_AGE;
	}
	public void setEMP_AGE(int eMP_AGE) {
		EMP_AGE = eMP_AGE;
	}
	public String getEMP_DEPART() {
		return EMP_DEPART;
	}
	public void setEMP_DEPART(String eMP_DEPART) {
		EMP_DEPART = eMP_DEPART;
	}
	public int getEMP_YRAR() {
		return EMP_YRAR;
	}
	public void setEMP_YRAR(int eMP_YRAR) {
		EMP_YRAR = eMP_YRAR;
	}
	@Override
	public String toString() {
		return "EMP [Id=" + Id + ", POST_TYPE=" + POST_TYPE + ", EMP_NAME=" + EMP_NAME + ", EMP_SEX=" + EMP_SEX
				+ ", EMP_AGE=" + EMP_AGE + ", EMP_DEPART=" + EMP_DEPART + ", EMP_YRAR=" + EMP_YRAR + "]";
	}
    
}
