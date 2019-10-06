class Genre

  attr_accessor :name
  extend Concerns::Findable
  
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
    song = Genre.new(name)
    song.save
    return song
  end

  def songs 
    @songs
  end

  def artists
    artists = @songs.collect {|song| song.artist}
    artists.uniq 
  end


end  
