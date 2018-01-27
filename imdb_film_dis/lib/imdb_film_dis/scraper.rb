require 'open-uri'
require 'pry'

require_relative "./film"

class ImdbFilmDis::Scraper

  def self.scrape_main_page
    # puts "Scrape Main Page"
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
    # puts "Finished Main Page Scrape"
  end

  def self.scrape_celeb_page(celeb)
    # puts "Scrape Celeb Page : #{celeb.name} - #{celeb.url}"
    doc = Nokogiri::HTML(open("http://www.imdb.com" + celeb.url))

    filmlist = doc.search("div.article div.filmo-category-section").first
    #puts "filmlist = #{filmlist}"

    filmlist.search("div").each do |row|
      #puts "Row = #{row}"
      year = row.css("span.year_column").text.strip
      if year != nil && year.gsub(/\A[[:space:]]/, "") != ""
        # puts "celeb = #{celeb.name} || year = '#{year}' || year.gsub = '#{year.gsub(/\A[[:space:]]/, "")}'"
        if year.size > 6
          # puts "Year = #{year}"
          if year.include?("/")
            year = year.split("/")[0]
            #puts "Has other version -- new year = #{year}"
          end
          #   #Note : The best way to fix this would be to create a loop that creates multiple instances of the show, but I'm going to nix that for now because it is unnecessarily complicated, instead, I'm going to have it only count for the FIRST year
          if year.include?("-")
            # puts "TV Show of multiple years"
            # minyear = year.split("-")[0]
            # maxyear = year.split("-")[1]
            # puts "range = #{minyear} to #{maxyear}"
            year = year.split("-")[0]
          end
        end
        filmname = row.css("b a").text.strip
        url = row.css("b a").attr("href").text.strip
        # puts "year = #{year} || filmname = #{filmname} || url = #{url} || celeb = #{celeb.name}"

        if !(ImdbFilmDis::Film.find_by_url(url))
          # puts "Create new film"
          film = ImdbFilmDis::Film.new(filmname, year, url, celeb)
        # else
        #   puts "Film already exists (checked via url)"
        end
      end
    end

    # ImdbFilmDis::Film.all.each do |film|
    #   puts "Film : #{film.name}. #{film.year} - #{film.url}"
    #   puts "#{ImdbFilmDis::Film.all.size}"
    # end

  end

end
