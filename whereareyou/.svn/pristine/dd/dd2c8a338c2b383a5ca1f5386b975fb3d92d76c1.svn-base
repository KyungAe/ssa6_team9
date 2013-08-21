package com.sds.sweng.whereareyou.domain;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


/* 프로젝트 클래스 */

public class Project implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String prjSeq = "";
	
	@NotNull
	@Size(min = 1, max = 100)
	private String prjNm = "";
	
	@NotNull
	@Size(min = 1, max = 150)
	private String prjAddr = "";	
	
	@NotNull
	private String prjRepIdEmpId = "";
	
	@NotNull
	private String prjRepEmpNm = "";

	@NotNull
	private int prjPosX;
	
	@NotNull
	private int prjPosY;

	public String getPrjSeq() {
		return prjSeq;
	}

	public void setPrjSeq(String prjSeq) {
		this.prjSeq = prjSeq;
	}

	public String getPrjNm() {
		return prjNm;
	}

	public void setPrjNm(String prjNm) {
		this.prjNm = prjNm;
	}

	public String getPrjAddr() {
		return prjAddr;
	}

	public void setPrjAddr(String prjAddr) {
		this.prjAddr = prjAddr;
	}

	public String getPrjRepIdEmpId() {
		return prjRepIdEmpId;
	}

	public void setPrjRepIdEmpId(String projRepIdEmpId) {
		this.prjRepIdEmpId = projRepIdEmpId;
	}

	public int getPrjPosX() {
		return prjPosX;
	}

	public void setPrjPosX(int prjPosX) {
		this.prjPosX = prjPosX;
	}

	public int getPrjPosY() {
		return prjPosY;
	}

	public void setPrjPosY(int prjPosY) {
		this.prjPosY = prjPosY;
	}

	public String getPrjRepEmpNm() {
		return prjRepEmpNm;
	}

	public void setPrjRepEmpNm(String prjRepEmpNm) {
		this.prjRepEmpNm = prjRepEmpNm;
	}

	@Override
	public String toString() {
		return "[prjSeq=" + prjSeq + ", prjNm=" + prjNm + ", prjAddr="
				+ prjAddr + ", projRepIdEmpId=" + prjRepIdEmpId + ", prjRepEmpNm="
				+ prjRepEmpNm + ", projPosX=" + prjPosX + ", projPosY=" + prjPosY
				+ "]";
	}
	
	

	
	
}