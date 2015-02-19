class CD

@@all_cds = []

  def initialize(artist, title)
    @artist = artist
    @title = title
    @id = @@all_cds.length + 1
  end

  def save
     @@all_cds.push(self)
  end

  def title
    @title
  end

  def self.all
    @@all_cds
  end

  def self.clear
    @@all_cds = []
  end

  def artist
    @artist
  end

  def id
    @id
  end

  def self.find_by_artist(artist_name)
    found_artist = nil
    @@all_cds.each do |cd|
      if cd.artist == artist_name
        found_artist = cd
      end
    end
    found_artist
  end

end
