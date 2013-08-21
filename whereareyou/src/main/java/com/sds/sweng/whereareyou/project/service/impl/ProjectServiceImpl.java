package com.sds.sweng.whereareyou.project.service.impl;

import java.util.ArrayList;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.core.idgen.IIdGenerationService;
import com.sds.sweng.whereareyou.domain.Project;
import com.sds.sweng.whereareyou.project.service.ProjectService;

@Service("foundationProjectService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class ProjectServiceImpl implements ProjectService {

	IIdGenerationService idGenerationService;

	@Inject
	@Named("foundationProjectDao")
	private ProjectDao projectDao;

	public void create(Project project) throws Exception {
		//project.setPrjSeq(idGenerationService.getNextIntegerId());
		projectDao.create(project);
	}

	public void remove(String seq) throws Exception {
		projectDao.remove(seq);
	}

	public void update(Project project) throws Exception {
		projectDao.update(project);
	}

	public Project get(String seq) throws Exception {
		return projectDao.get(seq);
	}
	
	public ArrayList<Project> getAllProject(Project project) throws Exception {
		return projectDao.getAllProject(project);
	}
}
