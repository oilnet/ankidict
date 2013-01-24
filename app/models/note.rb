class Note < ActiveRecord::Base
  attr_accessible :flds

  def flds
    self['flds'].gsub(/\[.*\]/, '') # Remove links to sound files present in some notes.
  end

  # Anki stores all vocabulary card data (except for the metadata)
  # in a single database column as a string separated by the Unicode
  # symbol as seen below.

  def source_lang
    flds.split(/\u001F/)[0]
  end

  def target_lang
    flds.split(/\u001F/)[1]
  end
end
