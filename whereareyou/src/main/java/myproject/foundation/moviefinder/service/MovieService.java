package myproject.foundation.moviefinder.service;

import myproject.domain.Movie;

public interface MovieService {

	Movie get(String movieId) throws Exception;

	void create(Movie movie) throws Exception;

	void update(Movie movie) throws Exception;

	void remove(String movieId) throws Exception;

}
