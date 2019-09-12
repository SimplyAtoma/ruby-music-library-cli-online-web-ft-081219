require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(find_name)
      self.all.detect{|o|  o.name == find_name}
    end
    
    def find_or_create_by_name(song_name) 
      if find_by_name(song_name)
        find_by_name(song_name)
      else
        self.create(song_name)
      end 
    end 
  end
end

require_all 'lib'
