1.flow
2.classes


- Users can go through all the top movie picks and select number to get the details
- details page has movie rating,genre and description
they can hit 0 to go back to the movie list to check another movie details.


classes:
- Movies
- CLI
- Scraper


movie names: doc.css("h3")[1].text.strip
movie director: doc.css("h5")[0].text
movie description: doc.css("p")[3].text

main = doc.css("div#wrapper").text
movie.rating = doc.css("div#wrapper").css(".title_bar_wrapper").css(".ratings_wrapper").css(".ratingValue").text.strip
movie.genre = doc.css("div#wrapper").css(".title_bar_wrapper").css(".subtext").css("a")[1].text
movie.duration = doc.css("div#wrapper").css(".title_bar_wrapper").css(".subtext").css("time").text.strip
description = doc.css("div").css(".plot_summary").css("div")[1].text.strip
