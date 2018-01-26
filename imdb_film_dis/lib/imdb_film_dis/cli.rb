
require_relative "./celeb"

class ImdbFilmDis::CLI

  def call
    puts "Top 50 Celebs of IMDB Sorted by Popularity Ascending"
    #Scrape Celebs from Top 50 webpage
    list_top_ten
    menu
  end

  def list_top_ten
    puts "List top ten celebs from IMDB"
    @celebs = ImdbFilmDis::Celeb.topten
  end

  # # Update to allow for selection of index in increments of 10 rather than just showing the top 10
  # def list_by_ten(range)
  #   puts "List top celebs from IMDB in increments of 10"
  #   #@celebs = ImdbFilmDis::Celeb.range(range)
  # end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the listed celeb you would like more info on, 'more', 'list', or 'exit'"
      input = gets.strip.downcase
      #puts "input #{input}"
      if input == "list"
        list_top_ten
      elsif input.to_i > 0
        puts "show celeb #{input.to_i}"
        #@celebs[input.to_i-1]
      else
        puts "Please only type in one of the approved actions"
      end
    end
    exitProgram
  end

  def exitProgram
    puts "Thanks for trying this gem!"
  end

end
