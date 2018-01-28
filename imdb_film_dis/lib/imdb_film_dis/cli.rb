
require_relative "./celeb"
require_relative "./scraper"
require 'nokogiri'

class ImdbFilmDis::CLI

  def call
    puts "Welcome to the Top 50 Celebs of IMDB Sorted by Popularity Ascending"
    puts "Scraping information... This will take about a minute."
    ImdbFilmDis::Scraper.scrape_main_page
    ImdbFilmDis::Celeb.all.each do |celeb|
      ImdbFilmDis::Scraper.scrape_celeb_page(celeb)
    end
    puts "Thank you for waiting!"
    menu
  end

  def menu
    range = 0
    while range == 0 || range == nil
      range = ImdbFilmDis::Celeb.set_range
      puts "Please select a number between 1-50"
    end

    input = nil
    while input != "exit"
      puts "Enter the number of the listed celeb you would like more info on, 'more', 'list', or 'exit'"
      input = gets.strip.downcase
      if input == "list"
        ImdbFilmDis::Celeb.display_celebs(range)
      elsif input == "more"
        menu
      elsif input.to_i > 0 && input.to_i < 51
        puts "#{ImdbFilmDis::Celeb.all[input.to_i-1].display_films}"
      else
        if input != "exit"
          puts "Please only type in one of the approved actions"
        else
          exitProgram
          return
        end
      end
    end
    exitProgram
  end

  def exitProgram
    puts "Thanks for trying this gem!"
  end

end
