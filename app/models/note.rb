class Note < ActiveRecord::Base
  attr_accessible :flds

  def source_lang
    flds.split(/\u001F/)[0]
  end

  def target_lang
    flds.split(/\u001F/)[1]
  end
end
