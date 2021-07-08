require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    new_by_name(name)
  end

  def self.find_by_name(name)
    all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(input)
    arr = input.split("-")
    artist = arr[0].strip
    song_name = arr[1].split(".")[0].strip
    
    song = find_or_create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(input)
    new_from_filename(input)
  end

  def self.destroy_all
    @@all = []
  end
end