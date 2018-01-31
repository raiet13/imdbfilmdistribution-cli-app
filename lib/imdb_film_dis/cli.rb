
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
    main_menu
  end

  def main_menu
    range = 0
    while range == 0 || range == nil
      range = ImdbFilmDis::Celeb.set_range
      if range == 0 || range == nil
        puts "Please select a number between 1-50"
      end
    end

    input = nil
    while input != "exit"
      puts "Enter the number of the listed celeb you would like more info on, 'more', 'list', or 'exit'"
      input = gets.strip.downcase
      if input == "list"
        ImdbFilmDis::Celeb.display_celebs(range)
      elsif input == "more"
        main_menu
      elsif input.to_i > 0 && input.to_i < 51
        puts "#{display_films_menu(ImdbFilmDis::Celeb.all[input.to_i-1])}"        
        ImdbFilmDis::Celeb.display_celebs(range)
      elsif input == "exit"
        exitProgram
        exit
      else
        puts "Please only type in one of the approved actions"
      end
    end
  end

  def exitProgram
    puts "Thanks for trying this program!"
  end

  def display_films_menu(celeb)
    celeb.display_films_hash_by_year(celeb.films_hash)

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
          celeb.display_films_hash_by_year(celeb.films_hash)
        when 2
          celeb.sort_films_hash_by_number
        when 3
          celeb.display_films_hash_in_specific_year
        when 4
          puts "Returning to Main Menu"
        else
          puts "Invalid input, please select one of the specified numbered actions."
      end
    end
  end


end
