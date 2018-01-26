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

  # Select range of celebs to display
  def self.set_range
    # puts "Lists the celebs with 'Num. Name' by range (1-10, 11-20,21-30,31-40,41-50)"

    puts "Select a range of celebs to display (1-10, 11-20,21-30,31-40,41-50)"
    input = gets.strip.downcase

    # puts "input = #{input} || #{input.to_i}"
    display_range = 0
    case input.to_i
      when 1..10
        puts "Range 1 - 1-10"
        display_range = 1..10
      when 11..20
        puts "Range 2 - 11-20"
        display_range = 11..20
      when 21..30
        puts "Range 3 - 21-30"
        display_range = 21..30
      when 31..40
        puts "Range 4 - 31-40"
        display_range = 31..40
      when 41..50
        puts "Range 5 - 41-50"
        display_range = 41..50
      else
        puts "Please select a number between 1-50"
      end

    # puts "display range = #{display_range}"
    display_celebs(display_range)
    display_range
  end

  def self.display_celebs(range)
    for i in range
      celeb = @@all[i - 1]
      #puts "List Celeb #{i} = #{celeb.display_details}"
      puts "#{celeb.display_details}"
    end
  end

  def display_details
    #@@all.detect{|song| song.name == name}
    #{}"#{@rank}. #{@name} - #{@url} | #{@films.size}"
    "#{@rank}. #{@name}"
  end

  def display_films
    display_details
    #Display film numbers by year
  end

  def display_film_details(film)

  end

end
