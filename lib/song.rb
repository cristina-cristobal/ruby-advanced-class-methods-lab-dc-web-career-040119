require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # the Song class provides a class variable @@all to store all instances for Song that are created through the instance method Song.save.

  def save
    self.class.all << self
  end


# .create should
  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    #takes in the string name of a song and returns a song instance with that name as its name property.
    #should return an instance of Song
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    # takes in the string name of a song and returns a song instance with that name set as its name property and the song being saved into the @@all class variable
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    #accepts the string name of a song and returns the matching instance of the song with that name.
    self.all.detect do |song|
      song.name == song_name
      # . detect returns the first for which block is not false
    end
  end

  def self.find_or_create_by_name(song_name)
    #returns a matching song instance with that name or create a new song with the name and return the song instance
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
      parts = filename.split(" - ")
      artist_name = parts[0]
      song_name = parts[1].gsub(".mp3", "")

      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song
    end

    def self.create_from_filename(filename)
      parts = filename.split(" - ")
      artist_name = parts[0]
      song_name = parts[1].gsub(".mp3", "")

      song = self.create
      song.name = song_name
      song.artist_name = artist_name
      song
    end

    def self.destroy_all
      self.all.clear
    end

end

# thriller = Song.create_by_name("Thriller")
# puts thriller

# thriller = Song.new_by_name("Thriller")
# puts thriller
# puts thriller.name
#
# puts "______"
# puts thriller.save

# song1 = Song.create
# puts song1

# # puts new_song = Song.new
# # new_song.name = "Hello"
# puts new_song.name
# new_song.save
# puts Song.all
