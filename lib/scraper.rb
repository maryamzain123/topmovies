  
class Scraper
    
    RELATIVE_URL = "https://www.imdb.com"

    def self.scrape_movies
        html = open("https://www.imdb.com/chart/boxoffice")
        doc = Nokogiri::HTML(html)
        
        doc.css("td.titleColumn").each do |mov|
            name =  mov.css("a").text
            url = mov.css("a").attr("href").value
            # instantiating new character with two objects to initialize method
            Movie.new(name, url)
        end
    end

    #scraping individual characters
    def self.scrape_ind_movies(movie)
        html = open(RELATIVE_URL + movie.url)
        doc = Nokogiri::HTML(html)
        movie.rating = doc.css("div#wrapper").css(".title_bar_wrapper").css(".ratings_wrapper").css(".ratingValue").text.strip
        movie.genre =  doc.css("div#wrapper").css(".title_bar_wrapper").css(".subtext").css("a")[0].text
        movie.description = doc.css("div").css(".plot_summary").css("div")[1].text.strip
    end
end