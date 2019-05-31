require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = [] #class variable
  
  # def initialize
  #   @name = name
  #   @artist_name = artist_name
  # end


  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
 
  def self.create
     song = self.new
    song.save #instance method
    song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song 
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
      self.all.find {|song| song.name == name}

  end

  def self.find_or_create_by_name(name)
    # binding.pry
      if self.find_by_name(name) == nil
        self.create_by_name(name)
      else
        self.find_by_name(name)
      end
  end

  def self.alphabetical
    @@all.sort_by{|song|song.name}
  end

  def self.create_artist_name(name, artist_name)
    song.artist_name = artist_name
    self.create_by_name(name)
  end

  def self.new_from_filename(filename)
   split_filename = filename.split("-")
   artist_name = split_filename[0].strip!
   name = split_filename[1].split('.')[0].strip!
   song = self.new
   song.name = name
   song.artist_name = artist_name
   song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
   new_song.save
  end

  def self.destroy_all
     self.all.clear
  end

end
 #binding.pry
