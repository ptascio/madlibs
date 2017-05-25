class Book < ActiveRecord::Base
  has_many :madlibs

  def self.search(search)
    
  end
end
