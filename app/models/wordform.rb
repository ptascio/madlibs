class Wordform < ActiveRecord::Base
  belongs_to :madlib

  def check_if_empty(words)
    if words.empty?
      self.errors.add(:base, "Entry cannot be blank")
    end
  end

  def check_over_under(words)
    if (words.include?(""))
      count = words.count("")
      self.errors.add(:base, "You need to enter #{count} more words")
    end
    # if (words.length < self.count) || (words.length > self.count)
    #   self.errors.add(:base, "You need to enter #{self.count} words")
    # end
  end

  def make_words_readable
    self.words = self.words.gsub(/\n/, "")
    self.words = self.words.split(", ")
    self.words
  end

  def make_user_form(madlib)
    story = madlib.story.split()
    sentence = ""
    count = 1
    story.each do |word|
      if word[0] == "_"
        new_word = parse_user_story(word)
        sentence += "#{count}: #{new_word}, "
        count+=1
      end
    end
    return sentence.chop.chop
  end

  def parse_user_story(word)
    words = ["adj, verb, noun"]
    stripped_word = word.gsub(/[^a-zA-Z]/, "")
    if (stripped_word == "adj")
      stripped_word = "Adjective"
    else
      stripped_word.capitalize!
    end
    return stripped_word
  end

end
