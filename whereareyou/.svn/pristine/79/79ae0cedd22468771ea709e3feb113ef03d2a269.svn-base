package myproject.foundation.moviefinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.core.idgen.IIdGenerationService;
import myproject.domain.Movie;
import myproject.foundation.moviefinder.service.MovieService;

@Service("foundationMovieService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class MovieServiceImpl implements MovieService {

	@Inject
	@Named("idGenerationServiceMovie")
	IIdGenerationService idGenerationService;

	@Inject
	@Named("foundationMovieDao")
	private MovieDao movieDao;

	public void create(Movie movie) throws Exception {
		movie.setMovieId(idGenerationService.getNextStringId());
		movieDao.create(movie);
	}

	public void remove(String movieId) throws Exception {
		movieDao.remove(movieId);
	}

	public void update(Movie movie) throws Exception {
		movieDao.update(movie);
	}

	public Movie get(String movieId) throws Exception {
		return movieDao.get(movieId);
	}
}
