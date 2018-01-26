class ImdbFilmDis::Film

  attr_accessor :name, :year, :celebs

  def initialize(name, year, celeb)
    @name = name
    @year = year
    celeb.films << self
  end

end
