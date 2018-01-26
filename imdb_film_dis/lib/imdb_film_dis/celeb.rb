class ImdbFilmDis::Celeb

  attr_accessor :name, :url, :films

  def self.topten
    "Lists the top ten celebs with 'Num. Name - Films'"
  end

  def get_celebs
    puts "Get Celebs"
  end

end
