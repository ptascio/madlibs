class Wordform < ActiveRecord::Base
  belongs_to :madlib

  def validate_submission(words)
    if words.empty?
      self.errors.add(:base, "Entry cannot be blank")
    end
  end
end
