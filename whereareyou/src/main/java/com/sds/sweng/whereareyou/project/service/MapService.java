package com.sds.sweng.whereareyou.project.service;

import java.util.ArrayList;

import com.sds.sweng.whereareyou.domain.Map;

public interface MapService {

	Map get(String seq) throws Exception;

	void create(Map map) throws Exception;

	void update(Map map) throws Exception;

	void remove(String seq) throws Exception;
	
	public ArrayList<Map> getAllMap(Map map) throws Exception;

}
