# encoding: UTF-8

require 'active_record/base'
require 'active_record/connection_adapters/sqlite_adapter'

module ActiveRecord::Arabic
  # List of Unicode characters taken from Houssam Salem's Anki plugin serving the same purpose.
  # (https://github.com/ntsp/anki-addons/blob/master/strip_arabic_diacritics.py)
  # They are documented in http://www.unicode.org/charts/PDF/U0600.pdf.
  DIACRITICS = [
    '\u0600', '\u0601', '\u0602', '\u0603', '\u0604', '\u0606', '\u0607',
    '\u0608', '\u0609', '\u060A', '\u060C', '\u060D', '\u060E', '\u060F',
    '\u0610', '\u0611', '\u0612', '\u0613', '\u0614', '\u0615', '\u0616',
    '\u0617', '\u0618', '\u0619', '\u061A', '\u061B', '\u061E', '\u061F',
    '\u0640', '\u066A', '\u066B', '\u066C', '\u066D', '\u06D4', '\u06D6',
    '\u06D7', '\u06D8', '\u06D9', '\u06DA', '\u06DB', '\u06DC', '\u06DD',
    '\u06DE', '\u06DF', '\u06E0', '\u06E1', '\u06E2', '\u06E3', '\u06E4',
    '\u06E7', '\u06E8', '\u06E9', '\u06EA', '\u06EB', '\u06EC', '\u06ED',
    '\u064B', '\uFE71', '\uFE70', '\u08F0', '\u08E7', '\u064C', '\uFE72',
    '\uFC5E', '\u08F1', '\u08E8', '\u064D', '\uFE74', '\uFC5F', '\u08F2',
    '\u08E9', '\u064E', '\uFE77', '\uFE76', '\uFCF2', '\uFC60', '\u08E4',
    '\u08F4', '\u08F5', '\u064F', '\uFE79', '\uFE78', '\uFCF3', '\uFC61',
    '\u08E5', '\u08FE', '\u0650', '\uFE7B', '\uFE7A', '\uFCF4', '\uFC62',
    '\u08E6', '\u08F6', '\u0651', '\uFE7D', '\uFE7C', '\uFC63', '\u0652',
    '\uFE7F', '\uFE7E', '\u0653', '\u0654', '\u0655', '\u065F', '\u0656',
    '\u0657', '\u0658', '\u0659', '\u065A', '\u065B', '\u065C', '\u065D',
    '\u065E', '\u08F7', '\u08F8', '\u08FD', '\u08FB', '\u08FC', '\u08F9',
    '\u08FA', '\u0670']
  def self.clean(string)
    string.force_encoding('utf-8')
    return string.gsub(/[#{DIACRITICS.join}]/, String.new)
  end
end

module ActiveRecord::ConnectionAdapters
  class SQLite3Adapter < SQLiteAdapter
    def initialize(db, logger, config)
      super
      # STRIP_ARABIC_DIACRITICS()
      db.create_function('strip_arabic_diacritics', 1) do |function, string|
        function.result = ActiveRecord::Arabic.clean(string)
      end
    end
  end
end
