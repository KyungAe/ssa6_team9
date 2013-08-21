package com.sds.sweng.whereareyou.domain;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Employee implements Serializable {

	private static final long serialVersionUID = 1L;

	private String empId = "";

	@NotNull
	@Size(min = 1, max = 30)
	private String empNm = "";

	@NotNull
	@Size(min = 1, max = 10)
	private String empEntSeq = "";

	@NotNull
	@Size(min = 1, max = 100)
	private String empDeptNm;

	@NotNull
	private String empSendCode;

	private String empPrjSeq = "";
	
	private String empPrjNm = "";
	
	public String getEmpPrjNm() {
		return empPrjNm;
	}
	
	public void setEmpPrjNm(String empPrjNm) {
		this.empPrjNm = empPrjNm;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpNm() {
		return empNm;
	}

	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	public String getEmpEntSeq() {
		return empEntSeq;
	}

	public void setEmpEntSeq(String empEntSeq) {
		this.empEntSeq = empEntSeq;
	}

	public String getEmpDeptNm() {
		return empDeptNm;
	}

	public void setEmpDeptNm(String empDeptNm) {
		this.empDeptNm = empDeptNm;
	}

	public String getEmpSendCode() {
		return empSendCode;
	}

	public void setEmpSendCode(String empSendCode) {
		this.empSendCode = empSendCode;
	}

	public String getEmpPrjSeq() {
		return empPrjSeq;
	}

	public void setEmpPrjSeq(String empPrjSeq) {
		this.empPrjSeq = empPrjSeq;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "[empId=" + empId + ", empNm=" + empNm + ", empEntSeq="
				+ empEntSeq + ", empDeptNm=" + empDeptNm + ", empSendCode="
				+ empSendCode + ", empPrjSeq=" + empPrjSeq + ", empPrjNm=" + empPrjNm + "]";
	}

	

}
