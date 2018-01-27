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

  # Check that film doesn't already exist (in case of Celeb crossover)
  def self.find_by_url(url)
    @@all.detect{|film| film.url == url}
  end

  # Display film details
  def details
    "#{@name} - #{@year} - #{@url}"
  end

end
