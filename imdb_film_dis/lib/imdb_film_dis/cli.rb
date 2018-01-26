class ImdbFilmDis::CLI

  def call
    puts "Top 10 Celebs of IMDB Sorted by Popularity Ascending"
    list_top_ten
    menu
  end

  def list_top_ten
    puts "List top ten celebs from IMDB"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the celeb you would like more info on or select 'exit' or 'list'"
      input = gets.strip.downcase
      puts "input #{input}"
      if input == "list"
        list_top_ten
      end
    end
    exitProgram
  end

  def exitProgram
    puts "Thanks for using this gem!"
  end

end
