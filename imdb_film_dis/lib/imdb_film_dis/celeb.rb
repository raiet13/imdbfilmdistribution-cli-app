class ImdbFilmDis::Celeb

  attr_accessor :name, :rank, :url, :films

  @@all = []

  def initialize(rank, name, url)
    @name = name
    @rank = rank
    @url = url
    @films = []
    @@all << self
  end

  def self.all
    @@all
  end

  #Replace with a single function that handles all ranges (see below)
  def self.topten
    "Lists the top ten celebs with 'Num. Name - Films'"
    for i in 1..10
      puts "List Celeb #{i}"
    end
  end

  # #Scraping 50 celebs so may as well give option of just seeing top 10 or any of them in increments of 10
  # def self.range(range)
  #   "Lists the celebs with 'Num. Name - Films' by range (1-10, 11-20,21-30,31-40,41-50)"
  # end

end
