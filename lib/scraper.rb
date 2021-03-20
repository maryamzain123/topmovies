class Scraper
    
    RELATIVE_URL = "https://www.imdb.com/"

    def self.scrape_movies
        html = open("https://www.imdb.com/")
        doc = Nokogiri::HTML(html)
        doc.css(".TopBoxOfficeTitle__BoxOfficeTitle-dujkoe-3.ldXnPT.boxOfficeTitle").each do |mov|
            name = mov.css(".TopBoxOfficeTitle__BoxOfficeTitleName-dujkoe-1.fpNAXa").text
            url = mov.css('a').attr('href').value
            Movie.new(name, url)
        end
    end

    def self.scrape_ind_movies(movie)
        html = open(RELATIVE_URL+movie.url)
        doc = Nokogiri::HTML(html)
        movie.rating = doc.css("div#wrapper").css(".title_bar_wrapper").css(".ratings_wrapper").css(".ratingValue").text.strip
        movie.genre =  doc.css("div#wrapper").css(".title_bar_wrapper").css(".subtext").css("a")[0].text
        movie.description = doc.css("div").css(".plot_summary").css("div")[1].text.strip
    end
end

