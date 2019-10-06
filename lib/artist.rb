class Artist 
  extend Findable::ClassMethods
  attr_accessor :name

  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Artist.new(name)
    song.save
    return song
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end


  def songs
    @songs
  end

  def genres 
    genres = @songs.collect {|song| song.genre}
    genres.uniq 
  end


end  