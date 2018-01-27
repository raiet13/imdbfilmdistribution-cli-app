class ImdbFilmDis::Film

  attr_accessor :name, :year, :url

  @@all = []

  def initialize(name, year, url, celeb)
    @name = name
    @year = year
    @url = url
    celeb.films << self
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_url(url)
    @@all.detect{|film| film.url == url}
  end

  #Need to be able to figure out better way to handle the movie-celeb-role relationship (since there can be multiple celebs in various roles per film)
  def details
    "#{@name} - #{@year} - #{@url}"
  end

end
