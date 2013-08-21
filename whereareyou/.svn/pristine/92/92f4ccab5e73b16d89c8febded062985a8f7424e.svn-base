package com.sds.sweng.whereareyou.project.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.core.idgen.IIdGenerationService;
import com.sds.sweng.whereareyou.domain.Map;
import com.sds.sweng.whereareyou.project.service.MapService;

@Service("foundationMapService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class MapServiceImpl implements MapService {

	IIdGenerationService idGenerationService;

	@Inject
	@Named("foundationMapDao")
	private MapDao mapDao;

	public void create(Map map) throws Exception {
		//map.setPrjSeq(idGenerationService.getNextIntegerId());
		mapDao.create(map);
	}

	public void remove(String seq) throws Exception {
		mapDao.remove(seq);
	}

	public void update(Map map) throws Exception {
		mapDao.update(map);
	}

	public Map get(String seq) throws Exception {
		return mapDao.get(seq);
	}
	public ArrayList<Map> getAllMap(Map map) throws Exception {
		return mapDao.getAllMap(map);
	}
}
