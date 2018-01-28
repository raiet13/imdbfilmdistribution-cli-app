class ImdbFilmDis::Film

  attr_accessor :name, :year, :url

  @@all = []

  def initialize(name, year, url, celeb)
    @name = name
    @year = year
    @url = url
    @@all << self

    add_to_celeb(celeb)
  end

  # Update celeb info
  def add_to_celeb(celeb)
    celeb.total_films += 1
    if celeb.films_hash[year]
      celeb.films_hash[year] << self
    else
      celeb.films_hash[year] = []
      celeb.films_hash[year] << self
    end
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
