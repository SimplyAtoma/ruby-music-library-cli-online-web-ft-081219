class Song 
  
  attr_accessor :name, :genre
  attr_reader :artist
  
  def initialize(parameters, artist_name = nil, genre_name = nil  )
    @name = parameters 
    if artist_name
      self.artist = artist_name
    end 
    if genre_name
      self.genre = genre_name
    end 
  end
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    Song.all.length.times do 
      Song.all.pop
    end
  end
  
  def save 
   Song.all << self 
  end
  
  def self.create(song_name)
   created_song = Song.new(song_name)
   created_song.save
   created_song
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self 
    end 
  end 
  
  def self.find_by_name(song_name)
    self.all.detect{|song|  song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name) 
    if Song.find_by_name(song_name)
      Song.find_by_name(song_name)
    else
      Song.create(song_name)
    end 
  end 
  
  def self.new_from_filename(file_name)
    split_file = []
    split_file = file_name.split(" - ")
    hold = split_file[2]
    hold = hold.split(".")
    unless Song.find_by_name(split_file[1])
      hold = Song.new(split_file[1], Artist.find_or_create_by_name(split_file[0]) ,Genre.find_or_create_by_name(hold[0]) )
      hold.save
      return hold
    end
    Song.find_by_name(split_file[1])
  end
  
  def self.create_from_filename(file_name)
    Song.new_from_filename(file_name)
  end
end