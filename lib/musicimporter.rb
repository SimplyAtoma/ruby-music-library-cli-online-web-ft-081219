class MusicImporter
  
  attr_accessor :path
  
  def initialize(file_name)
    @path = file_name
  end
  
  def files
    song_list = []
    Dir[path + "/*.mp3"].each {|file|  song_list << File.basename(file) }
    song_list
  end
  
  def import 
    self.files.each{|file_name| 
      Song.create_from_filename(file_name)
    }
  end 
end