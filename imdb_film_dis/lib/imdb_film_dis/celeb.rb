class ImdbFilmDis::Celeb

  attr_accessor :name, :rank, :url, :total_films, :films_hash

  @@all = []

  def initialize(rank, name, url)
    @name = name
    @rank = rank
    @url = url
    @total_films = 0
    @films_hash = {}
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
        display_range = 1..10
      when 11..20
        display_range = 11..20
      when 21..30
        display_range = 21..30
      when 31..40
        display_range = 31..40
      when 41..50
        display_range = 41..50
      else
        return
      end

    display_celebs(display_range)
    display_range
  end

  # Display Celeb basic details for a range of Celebs
  def self.display_celebs(range)
    puts "Displaying Celebs ranking between #{range}"
    for i in range
      celeb = @@all[i - 1]
      puts "   #{celeb.display_details}"
    end
  end

  # Retrieve Celeb general info
  def display_details
    "#{@rank}. #{@name} - #{@total_films} films"
  end

  # Celeb detail menu -- Display film numbers by year + interactive detail menu
  ## NOTE : One method of updating this might be to condense the menu similarly to the main menu -- use numbers for years and text for the rest
  def display_films_menu
    display_films_hash_by_year(@films_hash)

    input = nil
    while input.to_i != 4
      puts "Would you like to:"
      puts "  1. List the films again by year in descending order? (type '1')"
      puts "  2. Reorder the years based on the number of films? (type '2')"
      puts "  3. See the list of movies in a given year? (type '3')"
      puts "  4. Return to the main menu? (type '4')"

      input = gets.strip.downcase
      case input.to_i
        when 1
          display_films_hash_by_year(@films_hash)
        when 2
          sort_films_hash_by_number
        when 3
          display_films_hash_in_specific_year
        when 4
          puts "Returning to Main Menu"
        else
          puts "Invalid input, please select one of the specified numbered actions."
      end
    end
  end

  # List year and number of films
  def display_films_hash_by_year(hash)
    if hash == @films_hash
      puts "Showing Films by Year (Descending) for #{@rank}. #{@name} with #{@total_films} films"
    end

    hash.each do |year, films|
      puts "    #{year} - #{films.size}"
    end

    hash
  end

  # Display films in a specified year
  def display_films_hash_in_specific_year
    puts "Input a Year"
    input_year = gets.strip
    if @films_hash.has_key?(input_year)
      puts "Displaying Films for #{input_year}"
      @films_hash[input_year].each {|film| puts "    #{film.details}"}
    else
      puts "Please input one of the listed years"
      display_films_hash_in_specific_year
    end
  end

  # List display by num of films instead of year
  def sort_films_hash_by_number
    puts "Showing Years Listed by Number of Films (Descending) for #{@rank}. #{@name} with #{@total_films} films"
    sorted_hash = @films_hash.sort_by {|year, films| films.size}.reverse
    display_films_hash_by_year(sorted_hash)
    sorted_hash
  end

end
