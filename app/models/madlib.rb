class Madlib < ActiveRecord::Base
  belongs_to :book
  has_one :wordform

  def populate_story(story)
    misswords_array = self.split_up_misswords
    punctuation = [".", "?", "!"]
    story.each_with_index do |word,idx|
      if word[0] == "_"
        if punctuation.include?(word[-1])
          story[idx] = misswords_array.shift + word[-1]
        else
          story[idx] = misswords_array.shift
        end
      end
    end
    story.join(" ")
  end

  def array_story
     self.story.split()
  end

  def split_up_misswords
    self.wordform.misswords.split(", ")
  end

  def count_missing_words
    count = 0
    self.story.split.each do |word|
      if word[0] == "_"
        count+=1
      end
    end
    count
  end

  def check_user_story
    punctuation = [".", "?", "!"]
    count = 0
    user_story = self.array_story
    user_story.each do |word|
      if (word[0] == "_")
        if (punctuation.include?(word[-1]) && word[-2] == "_") ||
          (word[-1] == "_")
          count+=1
        end
      end
    end
    if count == 0
      return false
    else
      return count
    end
  end

end
