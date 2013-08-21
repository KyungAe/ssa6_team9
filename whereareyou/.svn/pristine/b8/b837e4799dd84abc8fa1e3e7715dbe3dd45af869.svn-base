package myproject.foundation.moviefinder.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import myproject.domain.Genre;
import myproject.foundation.moviefinder.service.GenreService;

@Service("foundationGenreService")
public class GenreServiceImpl implements GenreService {

	@Inject
	@Named("foundationGenreDao")
	private GenreDao genreDao;

	public List<Genre> getList() throws Exception {
		return genreDao.getList();
	}

}
