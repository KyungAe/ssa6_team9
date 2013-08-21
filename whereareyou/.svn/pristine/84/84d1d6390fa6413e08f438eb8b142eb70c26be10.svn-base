package com.sds.sweng.whereareyou.project.service.impl;


import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.sds.sweng.whereareyou.domain.Project;
import com.sds.sweng.whereareyou.project.service.ProjectFinder;
import anyframe.common.Page;

@Service("foundationProjectFinder")
public class ProjectFinderImpl implements ProjectFinder {
	
	@Inject
	@Named("foundationProjectDao")
	private ProjectDao projectDao;

	public Page getPagingList(Project project, int pageIndex) throws Exception {
		return this.projectDao.getPagingList(project, pageIndex);
	}
}
