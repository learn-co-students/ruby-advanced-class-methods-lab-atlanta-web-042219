require 'pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def initialize(name = '')
    @song = song
    @name = name
    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = Song.new
  end

  def Song.new_by_name(name)
    song = Song.new(name)
        return song
  end

  def Song.create_by_name(name)
    song = Song.new(name)
  end

  def Song.find_by_name(name)
    # song = Song.new(name)
    # binding.pry
    @@all.find { |element| name == element.name}
  end

  def Song.find_or_create_by_name(name)
    result_song = find_by_name(name)
    if result_song
      result_song
    else
      create_by_name(name)
    end
  end

  def Song.alphabetical
    @@all.sort_by { |element| element.name}
  end

  def Song.new_from_filename(file_name)
    song_file = file_name.split("-")
    name = song_file[1].strip.split('.')[0]
    song = Song.new(name)
    song.artist_name = song_file[0].strip
    # binding.pry
    song
  end

  def Song.create_from_filename(file_name)
    song_file = file_name.split("-")
    name = song_file[1].strip.split('.')[0]
    song = Song.new(name)
    song.artist_name = song_file[0].strip
    # binding.pry
    song
  end

  def Song.destroy_all
    @@all =[]
  end

end
