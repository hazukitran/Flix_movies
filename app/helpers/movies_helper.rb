module MoviesHelper
  def format_total_gross(movie)
    if movie.flop?
      "Flop!"
    else
      number_to_currency(movie.total_gross)
    end
  end
end
