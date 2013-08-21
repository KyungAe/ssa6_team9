package com.sds.sweng.whereareyou.project.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

import com.sds.sweng.whereareyou.domain.Map;

@Repository("foundationMapDao")
public class MapDao extends AbstractDAO {
	@Value("#{contextProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(Map map) throws Exception {
		create("Map", map);
	}

	public void remove(String seq) throws Exception {
		Map map = new Map();
		map.setPrjSeq(seq);
		remove("Map", map);
	}

	public void update(Map map) throws Exception {
		update("Map", map);
	}

	public Map get(String seq) throws Exception {
		Map map = new Map();
		map.setPrjSeq(seq);
		return (Map) findByPk("Map", map);
	}

	public Page getPagingList(Map map, int pageIndex) throws Exception {
		return this.findListWithPaging("Map", map, pageIndex, pageSize,
				pageUnit);
	}
	
	public ArrayList<Map> getAllMap(Map map) throws Exception {
		this.setFindListPostfix("AllList");
		@SuppressWarnings("unchecked")
		ArrayList<Map> result = (ArrayList<Map>) this.findList("Map", map);
		this.setFindListPostfix("List");
		return result;
	}
}
