package com.sds.sweng.whereareyou.project.service.impl;


import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.sds.sweng.whereareyou.domain.Map;
import com.sds.sweng.whereareyou.project.service.MapFinder;
import anyframe.common.Page;

@Service("foundationMapFinder")
public class MapFinderImpl implements MapFinder {
	
	@Inject
	@Named("foundationMapDao")
	private MapDao mapDao;

	public Page getPagingList(Map map, int pageIndex) throws Exception {
		return this.mapDao.getPagingList(map, pageIndex);
	}
}
