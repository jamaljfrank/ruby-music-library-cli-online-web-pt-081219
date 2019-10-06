class Song

  attr_accessor :name, :artist, :genre

  @@all = []


  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
    song = Song.new(name)
    song.save
    return song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

    def self.find_by_name(name)
      @@all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(filename)
      song = filename.split(" - ")
      artist, name, genre = song[0], song[1], song[2].gsub( ".mp3" , "")
      genre = Genre.find_or_create_by_name(genre)
      artist = Artist.find_or_create_by_name(artist)
      new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

end  