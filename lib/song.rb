class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  song = Song.create
  Song.all.include?(song)

  song =Song. new_by_name("The Middle")
  song =Name

  song=Song.create_by_name("The Middle")
  Song.all.include?(song)

  Song. find_by_name("The Middle")

  song1 = Song.find_or_create_by_name("Blank Space")
  song2 = Song.find_or_create_by_name("Blank Space")

  song.Song.new_from_filename("Taylor Swift - Blank Space.mp3")
  song.Name
  sond.artist_name
  




end
