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
    
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    # binding.pry
    @@all.find {|title| title.name == name}

  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end
  def self.new_from_filename(name)
    song = Song.new
    song.artist_name = name.split(" - ")[0]
    song.name = name.split(" - ")[1].gsub(".mp3", "")
    song
  end
  def self.create_from_filename(name)
    song = Song.new
    song.artist_name = name.split(" - ")[0]
    song.name = name.split(" - ")[1].gsub(".mp3", "")
    @@all << song
  end
  def self.destroy_all
    @@all = []
  end
end
