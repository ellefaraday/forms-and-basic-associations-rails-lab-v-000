class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    if contents != []
      contents.each do |c|
        if c != ""
          Note.create(content: c, song_id: self.id)
        end
      end
    else
    end
  end

  def note_contents
    if self.notes
      self.notes.map(&:content)
    else
      nil
    end
  end
end
