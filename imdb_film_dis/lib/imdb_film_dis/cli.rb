
require_relative "./celeb"
require_relative "./scraper"
require 'nokogiri'

class ImdbFilmDis::CLI

  def call
    puts "Top 50 Celebs of IMDB Sorted by Popularity Ascending"
    #Scrape Celebs from Top 50 webpage
    ImdbFilmDis::Scraper.scrape_main_page

    input = gets.strip.downcase
    ImdbFilmDis::Celeb.set_range(input)
    #mdbFilmDis::Celeb.get_range(range)

    #list_top_ten
    #menu
  end

  def list_top_ten
    puts "List top ten celebs from IMDB"
    @celebs = ImdbFilmDis::Celeb.topten
  end

  # Update to allow for selection of index in increments of 10 rather than just showing the top 10
  def list_by_ten(range)
    puts "List top celebs from IMDB in increments of 10"
    "Lists the celebs with 'Num. Name' by range (1-10, 11-20,21-30,31-40,41-50)"
    #@celebs = ImdbFilmDis::Celeb.range(range)
  end

  def menu
    input = nil
    current_range = 1
    while input != "exit"
      puts "Enter the number of the listed celeb you would like more info on, 'more', 'list', or 'exit'"
      input = gets.strip.downcase
      #puts "input #{input}"
      if input == "list"
        list_top_ten
      elsif input == "more"
        puts "show more ranges"
      elsif input.to_i > 0
        #puts "show celeb #{input.to_i}"
        puts "#{ImdbFilmDis::Celeb.all[input.to_i-1].display_details}"
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
