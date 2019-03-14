require 'pry'

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
    @name = name 
    self.all << name 
    
  end 
end

song = Song.create 
Song.all.include?(song)
