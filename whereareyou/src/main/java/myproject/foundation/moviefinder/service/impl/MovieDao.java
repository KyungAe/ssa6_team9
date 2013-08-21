package myproject.foundation.moviefinder.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;
import myproject.domain.Movie;

@Repository("foundationMovieDao")
public class MovieDao extends AbstractDAO {
	@Value("#{contextProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(Movie movie) throws Exception {
		create("Movie", movie);
	}

	public void remove(String movieId) throws Exception {
		Movie movie = new Movie();
		movie.setMovieId(movieId);
		remove("Movie", movie);
	}

	public void update(Movie movie) throws Exception {
		update("Movie", movie);
	}

	public Movie get(String movieId) throws Exception {
		Movie movie = new Movie();
		movie.setMovieId(movieId);
		return (Movie) findByPk("Movie", movie);
	}

	public Page getPagingList(Movie movie, int pageIndex) throws Exception {
		return this.findListWithPaging("Movie", movie, pageIndex, pageSize,
				pageUnit);
	}
}
