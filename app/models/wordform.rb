class Wordform < ActiveRecord::Base
  belongs_to :madlib

  def check_if_empty(words)
    if words.empty?
      self.errors.add(:base, "Entry cannot be blank")
    end
  end

  def check_over_under(words)
    if (words.split.length < self.count) || (words.split.length > self.count)
      self.errors.add(:base, "You need to enter #{self.count} words")
    end
  end

  def make_words_readable
    self.words = self.words.gsub(/\n/, "")
    self.words = self.words.split(", ")
    self.words
  end

  def make_user_form(madlib)
    story = madlib.story
  end

  def parse_user_story
  end
end
