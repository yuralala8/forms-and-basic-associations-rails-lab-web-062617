require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def note_contents=(content)
    # content is an array
    content.each do |note|
      if note.strip != ''
      new_note = Note.find_or_create_by(content: note)
      self.notes << new_note
      end
    end
end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def song_title
    self.title
  end

  def song_artist_name
  end

end
