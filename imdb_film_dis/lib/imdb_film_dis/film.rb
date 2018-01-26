class ImdbFilmDis::Film

  attr_accessor :name, :year, :celebs

  def initialize(name, year, celeb)
    @name = name
    @year = year
    celeb.films << self
  end

  #Need to be able to figure out better way to handle the movie-celeb-role relationship (since there can be multiple celebs in various roles per film)
  def details
    "#{@name} - #{@year}"
  end

end
