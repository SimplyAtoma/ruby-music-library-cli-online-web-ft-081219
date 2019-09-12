class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    cli = MusicImporter.new(path)
    cli.import 
  end
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = " "
    while input != "exit"
      input = gets
    end 
  end
  
  def list_songs
    count = 1
    Song.all.sort_by{|song| song.name}.each{|song|
    puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    count += 1
    }
  end 
  
  def list_artists
    count = 1
    Artist.all.sort_by{|artist| artist.name}.each{|artist|
      puts "#{count}. #{artist.name}"
      count += 1
    }
  end 
  
  def list_genres
    count = 1
    Genre.all.sort_by{|genre| genre.name}.each{|genre|
      puts "#{count}. #{genre.name}"
      count += 1
    }
  end 
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    input = gets
  end 
  
  def list_songs_by_genre 
    
  end 
end