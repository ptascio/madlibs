class Book < ActiveRecord::Base
  has_many :madlibs

  def self.search(search)
    where("title like ?", "%#{search}%")
  end
end
