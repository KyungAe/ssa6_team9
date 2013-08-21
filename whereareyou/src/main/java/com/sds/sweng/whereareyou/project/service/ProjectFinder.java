package com.sds.sweng.whereareyou.project.service;

import anyframe.common.Page;
import com.sds.sweng.whereareyou.domain.Project;

public interface ProjectFinder {
	Page getPagingList(Project project, int pageIndex) throws Exception;
}
