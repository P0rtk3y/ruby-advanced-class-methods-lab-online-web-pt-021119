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
    song = self.new 
    song.save if !self.all.include?(song)
    song 
  end 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song 
  end
  
  def self.create_by_name(name)
    song = self.create 
    song.name = name 
    song
  end 
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name} 
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical 
    self.all.sort_by{|song| song.name} 
  end 
  
  def self.new_from_filename(filename)
    new_format = filename.split(" - ")
    artist = new_format.first 
    name = new_format.last.chomp(".mp3")
    
    song = self.new 
    song.name = name 
    song.artist = artist 
    song 
  end 
end


