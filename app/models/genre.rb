class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres

  def slug
    self.name.downcase.split(' ').join('-')
  end

  def self.find_by_slug(slug)
    self.all.find{|a| a.slug == slug}
  end

end
