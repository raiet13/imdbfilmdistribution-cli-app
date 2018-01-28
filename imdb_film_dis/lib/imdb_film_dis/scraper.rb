require 'open-uri'
require 'pry'

require_relative "./film"

class ImdbFilmDis::Scraper

  def self.scrape_main_page
    puts "Scraping Top 50 Page"
    doc = Nokogiri::HTML(open("http://www.imdb.com/search/name?gender=male,female&ref_=rlm"))
    doc.css("div.lister-list div.lister-item-content").each do |celeb|
      rank = celeb.css("h3.lister-item-header span").text.gsub(".", "").strip
      name = celeb.css("h3.lister-item-header a").text.strip
      url = celeb.css("h3.lister-item-header a").attr("href").text.strip
      celeb = ImdbFilmDis::Celeb.new(rank, name, url)
    end
    puts "Finished Scraping Top 50 Page"
  end

  def self.scrape_celeb_page(celeb)
    puts "Scraping #{celeb.rank} of 50"
    doc = Nokogiri::HTML(open("http://www.imdb.com" + celeb.url))
    filmlist = doc.search("div.article div.filmo-category-section").first
    filmlist.search("div").each do |row|
      year = row.css("span.year_column").text.strip
      if year != nil && year.gsub(/\A[[:space:]]/, "") != ""
        if year.size > 6
          year = year.split("/")[0] if year.include?("/")
          year = year.split("-")[0] if year.include?("-")
        end
        filmname = row.css("b a").text.strip
        url = row.css("b a").attr("href").text.strip

        if !(ImdbFilmDis::Film.find_by_url(url))
          film = ImdbFilmDis::Film.new(filmname, year.gsub("\u00A0", ""), url, celeb)
        else
          ImdbFilmDis::Film.find_by_url(url).add_to_celeb(celeb)
        end

      end
    end
  end

end
