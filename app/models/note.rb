class Note < ActiveRecord::Base
  attr_accessible :flds

  def flds
    self['flds'].gsub(/\[.*\]/, '') # Remove links to sound files present in some notes.
  end

  # Anki stores all vocabulary card data (except for the metadata)
  # in a single database column as a string separated by the Unicode
  # symbol as seen below.

  def de
    flds.split(/\u001F/)[0]
  end

  def ar_singular_or_perfect
    flds.split(/\u001F/)[1]
  end

  def ar_plural_or_imperfect
    flds.split(/\u001F/)[2] || nil
  end

  def ar_verbal_noun
    flds.split(/\u001F/)[3] || nil
  end
end
