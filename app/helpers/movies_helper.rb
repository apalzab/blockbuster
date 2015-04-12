module MoviesHelper

  def show_movies(movies)
    str = "<div id='movies' class='movies'>"
    movies.each_slice(3).each do |row_of_movies|
      str += "<div class='row'>"
        row_of_movies.each do |movie|
          str += render movie
        end
      str += "</div>"
    end
    str += "</div>"
  end
end