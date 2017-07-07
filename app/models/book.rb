class Book < ActiveRecord::Base
  has_many :madlibs

  def self.search(search)
    where('
    (title like ? AND exclusive = ?)',
    "%#{search}%", 0
    )
  end

  def self.user_search(search)
    where(
    '(title like ? AND exclusive = ?) OR
    (title like ? AND exclusive = ? AND user_id IS NULL)',
     "%#{search}%", 0,
     "%#{search}%", 1
    )
  end

  def self.find_user_books(current_user)
    current_user_id = current_user.id
    @user_books = Book.where(:user_id => [current_user_id, nil]).all
    @user_books
  end
end
