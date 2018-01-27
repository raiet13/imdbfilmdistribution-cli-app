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
    puts "Select a range of celebs to display (1-10, 11-20, 21-30, 31-40, 41-50)"
    input = gets.strip.downcase

    display_range = 0
    case input.to_i
      when 1..10
        puts "Selected Range 1 - 1-10"
        display_range = 1..10
      when 11..20
        puts "Selected Range 2 - 11-20"
        display_range = 11..20
      when 21..30
        puts "Selected Range 3 - 21-30"
        display_range = 21..30
      when 31..40
        puts "Selected Range 4 - 31-40"
        display_range = 31..40
      when 41..50
        puts "Selected Range 5 - 41-50"
        display_range = 41..50
      else
        puts "Please select a number between 1-50"
      end

    display_celebs(display_range)
    display_range
  end

  # Display Celeb basic details for a range of Celebs
  def self.display_celebs(range)
    for i in range
      celeb = @@all[i - 1]
      puts "#{celeb.display_details}"
    end
  end

  # Retrieve Celeb general info
  def display_details
    #puts "#{@rank}. #{@name} - #{@films.size} films"
    "#{@rank}. #{@name} - #{@films.size} films"
  end

  # Celeb detail menu -- Display film numbers by year + interactive detail menu
  def display_films
    puts "Showing Information for #{@rank}. #{@name} with #{@films.size} films"

    hash = get_films_by_year
    hash.each do |year, filmarray|
      puts "  #{year} - #{filmarray.size}"
    end

    input = nil
    while input.to_i != 3
      puts "Would you like to:"
      puts "1. Reorder the years based on the number of films? (type '1')"
      puts "2. See the list of movies in a given year? (type '2')"
      puts "3. Return to the main menu? (type '3')"
      input = gets.strip.downcase
      case input.to_i
        when 1
          sort_films_by_number(get_films_by_year)
        when 2
          puts "Input a Year"
          input_year = gets.strip
          puts "Displaying Films for #{input_year}"
          hash[input_year].each {|film| puts "  #{film.details}"}
        when 3
          puts "Returning to Main Menu"
        else
          puts "Invalid input, please select one of the specified numbered actions."
      end
    end
  end

  # Hash for films by year (to get num of films and film names)
  def get_films_by_year
    years_hash = {}
    @films.each do |film|
      key = film.year.gsub("\u00A0", "")
      if years_hash[key]
        years_hash[key] << film
      else
        years_hash[key] = []
        years_hash[key] << film
      end
    end
    years_hash
  end

  # Sort hash to display by num of films instead of year
  def sort_films_by_number(hash)
    puts "Years Listed by Number of Films (Descending) for #{@name}"
    sorted_hash = hash.sort_by {|year, films| films.size}.reverse
    sorted_hash.each do |year, filmarray|
      puts "  #{year} - #{filmarray.size}"
    end
    sorted_hash
  end

end
