require 'open-uri'
require 'pry'

class ImdbFilmDis::Scraper

  def self.scrape_main_page
    puts "Scrape Main Page"
    doc = Nokogiri::HTML(open("http://www.imdb.com/search/name?gender=male,female&ref_=rlm"))
    doc.css("div.lister-list").each do |celeb|
      data = celeb.css("div.lister-item-content h3.lister-item-header")
      puts "data = #{data}"
      #puts "name = #{name} || rank = #{rank}"
    end
  end

  def self.scrape_celeb_page(url)
    puts "Scrape Celeb Page : #{url}"
    doc = Nokogiri::HTML(open(url))

  end

end
