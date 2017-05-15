# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@pets_book = Book.create({title: "Wacky Pets"})

@tuesday = Madlib.create({title: 'Tuesday The Cat', story: "
  Tuesday is a nice cat with a(n) __adj__ __noun__.
  She is always __verb__.
  Tuesday likes to ___verb___ and ___verb___.
  I think she is a __adj___ cool __noun__.
  ", book_id: 1})

tuesday_form = Wordform.create({words: "1: Adjective, 2: Noun, 3: Verb, 4: Verb,
5: Verb, 6: Adjective, 7: Noun"})

@tuesday.wordform = tuesday_form

@sam_the_snake = Madlib.create({title: 'Sam The Snake', story: "
  Watch out! Sam the Snake is __verb__.
  What does Sam __verb__?
  Do you think he is ___verb___?
  Sam is __adj__, but he is our __noun__.
  ", book_id: 1})

  sam_form = Wordform.create({words: "1: Verb, 2: Verb, 3: Verb, 4: Adjective,
  5: Noun"})
@sam_the_snake.wordform = sam_form

@wu_tang = Book.create({title:"Killer Bees!"})
@rza = Madlib.create({title: "Hi", story: 'Hi', book_id:2})
