class Note < ActiveRecord::Base
  attr_accessible :flds, :tags

  def flds
    self['flds'].gsub(/\[.*\]/, '') # Remove links to sound files present in some notes.
  end

  alias fields flds

  # Anki stores all vocabulary card data (except for the metadata)
  # in a single database column as a string separated by the Unicode
  # symbol as seen below.

  def de
    fields.split(/\u001F/)[0]
  end

  def ar_singular_or_perfect
    fields.split(/\u001F/)[1]
  end

  def ar_plural_or_imperfect
    fields.split(/\u001F/)[2] || nil
  end

  def ar_verbal_noun
    fields.split(/\u001F/)[3] || nil
  end
end
