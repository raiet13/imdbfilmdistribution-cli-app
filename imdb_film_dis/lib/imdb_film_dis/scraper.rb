require 'open-uri'
require 'pry'

class ImdbFilmDis::Scraper

  def self.scrape_main_page
    puts "Scrape Main Page"
    doc = Nokogiri::HTML(open("http://www.imdb.com/search/name?gender=male,female&ref_=rlm"))
    doc.css("div.lister-list div.lister-item-content").each do |celeb|
      # data = celeb.css("h3.lister-item-header")
      # puts "data = #{data}"
      rank = celeb.css("h3.lister-item-header span").text.gsub(".", "").strip
      name = celeb.css("h3.lister-item-header a").text.strip
      url = celeb.css("h3.lister-item-header a").attr("href").text.strip

      #Note : Additional details to consider including
      # job = celeb.css("p.text-muted").text.strip
      # knownfor = celeb.css("p.text-muted a").text.strip

      #puts "name = #{name} || rank = #{rank} || url = #{url} || job = #{job} || knownfor = #{knownfor}"
      celeb = ImdbFilmDis::Celeb.new(rank, name, url)
    end

    # ImdbFilmDis::Celeb.all.each do |celeb|
    #   puts "Celeb : #{celeb.rank}. #{celeb.name} - #{celeb.url} - #{celeb.films.size}"
    # end
  end

  def self.scrape_celeb_page(url)
    puts "Scrape Celeb Page : #{url}"
    doc = Nokogiri::HTML(open("http://www.imdb.com/" + url))

  end

end