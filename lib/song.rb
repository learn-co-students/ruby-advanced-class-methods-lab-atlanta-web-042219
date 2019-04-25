class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
  	new_song = self.new
  	@@all << new_song
  	new_song
  end

  def self.new_by_name(obj_name)
  	new_song = self.new
  	new_song.name = obj_name
  	new_song
  end

  def self.create_by_name(obj_name)
  	new_song = self.new
  	new_song.name = obj_name
  	new_song.save
  	new_song
  end

  def self.find_by_name(search)
  	@@all.each {|obj|return obj if obj.name == search}
  	nil
  end

  def self.find_or_create_by_name(search)
  	search_result = self.find_by_name(search)
  	if search_result == nil
  		self.create_by_name(search)
  	else
  		search_result
  	end
  end

  def self.alphabetical
  	@@all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(file)
  	new_song = Song.new
  	file = file.split(/\ - |\./)
  	new_song.artist_name = file[0]
  	new_song.name = file[1]
  	new_song
  end

  def self.create_from_filename(file)
  	new_song = Song.new
  	file = file.split(/\ - |\./)
  	new_song.artist_name = file[0]
  	new_song.name = file[1]
  	new_song.save
  	new_song
  end

  def self.destroy_all
  	@@all.clear
  end

  def save
    Song.all << self
  end

end
