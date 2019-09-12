class Artist 
  
  attr_accessor :name
  extend Concerns::Findable
  
  def initialize(artist_name)
    @name = artist_name
    @songs = []
  end
  
  @@all = []
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    Artist.all.length.times do 
      Artist.all.pop
    end 
  end 
  
  def save 
    Artist.all << self
  end 
  
  def self.create(artist_name)
    created_artist = Artist.new(artist_name)
    created_artist.save
    created_artist
  end
  
  def add_song(new_song)
    if new_song.artist == nil
      new_song.artist = self 
    end 
    if self.songs.include?(new_song) == false
      self.songs << new_song
    end 
      
  end 
  
  def songs 
    @songs 
  end 
  
  def genres 
    filtered_genres = []
    self.songs.each{|song|
      if filtered_genres.include?(song.genre) == false 
        filtered_genres << song.genre
      end 
    }
    filtered_genres
  end
end