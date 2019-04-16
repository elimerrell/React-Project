# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.destroy_all 
Notebook.destroy_all
Note.destroy_all

10.times do
    Group.create(
        name: Faker::Hipster.word
    )
end 
puts Group.first

10.times do
    Notebook.create(
        group_id: rand(1..10),
        title: Faker::Marketing.buzzwords,
        description: Faker::Hipster.sentence
    )
end 
puts Notebook.first


100.times do
    Note.create(
        notebook_id: rand(1..10),
        title: Faker::Marketing.buzzwords,
        content: Faker::Hipster.sentence,
        color: "#ffffa5"
    )
end 
puts Note.first
