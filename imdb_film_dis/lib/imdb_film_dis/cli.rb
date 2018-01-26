
require_relative "./celeb"

class ImdbFilmDis::CLI

  def call
    puts "Top 10 Celebs of IMDB Sorted by Popularity Ascending"
    list_top_ten
    menu
  end

  def list_top_ten
    puts "List top ten celebs from IMDB"
    @celebs = ImdbFilmDis::Celeb.topten
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the celeb you would like more info on, 'exit', or 'list'"
      input = gets.strip.downcase
      #puts "input #{input}"
      if input == "list"
        list_top_ten
      elsif input.to_i > 0
        puts "show celeb #{input.to_i}"
        @celebs[input.to_i-1]
      else
        puts "Please only type in one of the approved actions"
      end
    end
    exitProgram
  end

  def exitProgram
    puts "Thanks for using this gem!"
  end

end
