  
class Movie 
    attr_accessor  :name, :url, :rating, :genre, :description

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end
end