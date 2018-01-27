
require_relative "./celeb"
require_relative "./scraper"
require 'nokogiri'

class ImdbFilmDis::CLI

  def call
    puts "Welcome to the Top 50 Celebs of IMDB Sorted by Popularity Ascending"
    puts "Scraping information... This will take about a minute."
    #Scrape Celebs from Top 50 webpage
    ImdbFilmDis::Scraper.scrape_main_page

    for i in 17..18
      celeb = ImdbFilmDis::Celeb.all[i - 1]
      ImdbFilmDis::Scraper.scrape_celeb_page(celeb)
    end
    # puts "Select a celeb to display films for (1-5)"
    # input = gets.strip.downcase
    # puts "#{ImdbFilmDis::Celeb.all[input.to_i-1].display_films}"

    # ImdbFilmDis::Celeb.all.each do |celeb|
    #   ImdbFilmDis::Scraper.scrape_celeb_page(celeb)
    # end
    puts "Thank you for waiting!"
    menu
  end

  def menu
    # puts "Start menu"
    range = ImdbFilmDis::Celeb.set_range
    input = nil
    while input != "exit"
      # puts "Range = #{range}"
      puts "Enter the number of the listed celeb you would like more info on, 'more', 'list', or 'exit'"
      input = gets.strip.downcase
      #puts "input #{input}"
      if input == "list"
        ImdbFilmDis::Celeb.display_celebs(range)
      elsif input == "more"
        # puts "Show more ranges -- restart menu to activate range set"
        menu
      elsif input.to_i > 0 && input.to_i < 51
        # puts "Show info of celeb #{input.to_i}"
        puts "#{ImdbFilmDis::Celeb.all[input.to_i-1].display_films}"
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
