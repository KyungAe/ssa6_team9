package com.sds.sweng.whereareyou.project.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;
import com.sds.sweng.whereareyou.domain.Project;

@Repository("foundationProjectDao")
public class ProjectDao extends AbstractDAO {
	@Value("#{contextProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(Project project) throws Exception {
		create("Project", project);
	}

	public void remove(String seq) throws Exception {
		Project project = new Project();
		project.setPrjSeq(seq);
		remove("Project", project);
	}

	public void update(Project project) throws Exception {
		update("Project", project);
	}

	public Project get(String seq) throws Exception {
		Project project = new Project();
		project.setPrjSeq(seq);
		return (Project) findByPk("Project", project);
	}

	public Page getPagingList(Project project, int pageIndex) throws Exception {
		return this.findListWithPaging("Project", project, pageIndex, pageSize,
				pageUnit);
	}
	
	public ArrayList<Project> getAllProject(Project project) throws Exception {
		this.setFindListPostfix("AllList");
		@SuppressWarnings("unchecked")
		ArrayList<Project> result = (ArrayList<Project>) this.findList("Project", project);
		this.setFindListPostfix("List");
		return result;
	}
}
