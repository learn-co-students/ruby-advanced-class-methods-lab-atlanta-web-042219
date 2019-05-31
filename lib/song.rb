require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
      song.save
      song
  end

  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    song
  end

  def self.create_by_name(new_name)
    song = self.new
    song.name = new_name
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.find {|songs| songs.name == title}
  end

  def self.find_or_create_by_name(title)
      self.create_by_name(title)
      self.find_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by! {|songs| songs.name}
  end

  def self.new_from_filename(artist, song_name)
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
    # binding.pry
  end

  def self.create_from_filename(art, sname)
    song = self.new
    song.artist_name = art
    song.name = sname
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
