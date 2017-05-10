# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tuesday = Madlib.create([{title: 'Tuesday The Cat', story: "
  Tuesday is a nice cat with a(n) __adj__ _noun___.
  She is always __verb__.
  Tuesday likes to ___verb___ and ___verb___.
  I think she is a __adj___ cool __noun__.
  "}])
