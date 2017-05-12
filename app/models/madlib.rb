class Madlib < ActiveRecord::Base
  has_one :wordform

  def populate_story(story)
    misswords_array = self.split_up_misswords
    story.each_with_index do |word,idx|
      if word[0] == "_"
        if word[-1] == "."
          story[idx] = misswords_array.shift + "."
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
end
