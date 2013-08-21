package com.sds.sweng.whereareyou.project.service;

import anyframe.common.Page;

import com.sds.sweng.whereareyou.domain.Map;

public interface MapFinder {
	Page getPagingList(Map map, int pageIndex) throws Exception;
}
