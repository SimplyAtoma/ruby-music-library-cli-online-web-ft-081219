class Genre
  
 attr_accessor :name, :songs
 extend Concerns::Findable
 
 def initialize(genre_name)
   @name = genre_name
   @songs = []
 end 
 
 @@all = []
 
 def self.all 
   @@all 
 end 
 
 def self.destroy_all
   Genre.all.length.times do 
     Genre.all.pop
   end 
 end 
 
 def save 
   Genre.all << self 
 end 
 
 def self.create(genre_name)
   created_genre = Genre.new(genre_name)
   created_genre.save
   created_genre
 end 
 
 def songs 
   @songs
 end 
 
 def artists 
   filtered_artist = []
    self.songs.each{|song|
      if filtered_artist.include?(song.artist) == false 
        filtered_artist << song.artist
      end 
    }
    filtered_artist
 end 
end