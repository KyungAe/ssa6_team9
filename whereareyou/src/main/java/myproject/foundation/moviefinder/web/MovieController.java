package myproject.foundation.moviefinder.web;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Collection;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import myproject.domain.Genre;
import myproject.domain.Movie;
import myproject.foundation.moviefinder.service.GenreService;
import myproject.foundation.moviefinder.service.MovieService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

@Controller("foundationMovieController")
@RequestMapping("/foundationMovie.do")
@SessionAttributes(types = Movie.class)
public class MovieController {

	@Inject
	@Named("foundationMovieService")
	private MovieService movieService;

	@Inject
	@Named("foundationGenreService")
	private GenreService genreService;

	@ModelAttribute("genreList")
	public Collection<Genre> populateGenreList() throws Exception {
		return this.genreService.getList();
	}

	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new Movie());
		return "foundationViewMovie";
	}

	@RequestMapping(params = "method=create")
	public String create(
			@RequestParam(value = "realPosterFile", required = false) MultipartFile posterFile,
			@Valid Movie movie, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		if (results.hasErrors()) {
			return "foundationViewMovie";
		}
		
		if (posterFile != null && !posterFile.getOriginalFilename().equals("")) {
			String pictureName = posterFile.getOriginalFilename();

			String destDir = session.getServletContext().getRealPath(
					"/sample/images/posters/");

			File dirPath = new File(destDir);
			if (!dirPath.exists()) {
				boolean created = dirPath.mkdirs();
				if (!created) {
					throw new Exception(
							"Fail to create a directory for movie image. ["
									+ destDir + "]");
				}
			}
			
			File destination = File
					.createTempFile("file", pictureName, dirPath);

			FileCopyUtils.copy(posterFile.getInputStream(),
					new FileOutputStream(destination));

			movie.setPosterFile("sample/images/posters/"
					+ destination.getName());
		}

		this.movieService.create(movie);
		status.setComplete();

		return "redirect:/foundationMovieFinder.do?method=list";
	}

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("movieId") String movieId, Model model)
			throws Exception {
		Movie movie = this.movieService.get(movieId);
		if (movie == null) {
			throw new Exception("Resource not found " + movieId);
		}
		model.addAttribute(movie);

		return "foundationViewMovie";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid Movie movie, BindingResult results, SessionStatus status) throws Exception {
		if (results.hasErrors()) {
			return "foundationViewMovie";
		}
		
		this.movieService.update(movie);
		status.setComplete();

		return "redirect:/foundationMovieFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("movieId") String movieId)
			throws Exception {
		this.movieService.remove(movieId);
		return "redirect:/foundationMovieFinder.do?method=list";
	}
}
