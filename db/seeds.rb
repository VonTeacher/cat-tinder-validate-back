# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cats = [
    {
      name: 'Felix',
      age: 2,
      enjoys: 'Long naps on the couch, and a warm fire.'
    },
    {
      name: 'Homer',
      age: 12,
      enjoys: 'Food mostly, really just food.'
    },
    {
      name: 'Jack',
      age: 5,
      enjoys: 'Furrrrociously hunting bugs.'
    },
    {
        name: 'Parsely',
        age: 2,
        enjoys: 'Enjoys Eating'
    }
  ]

  cats.each do |value|
    Cat.create value
    puts "creating cat #{value}"
  end