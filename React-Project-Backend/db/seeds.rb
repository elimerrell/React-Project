# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Notebook.destroy_all	
Note.destroy_all	
User.destroy_all	


 User.create(	
    name: 'Mario',	
    email: 'itsame@mar.io',	
    password: '1234'	
)	
puts User.first.to_json	

 5.times do	
    Notebook.create(	
        user_id: User.first.id,	
        category: "work",	
        title: Faker::Marketing.buzzwords,	
        description: Faker::Hipster.sentence	
    )	
end
5.times do	
    Notebook.create(	
        user_id: User.first.id,	
        category: "school",	
        title: Faker::Marketing.buzzwords,	
        description: Faker::Hipster.sentence	
    )	
end 
5.times do	
    Notebook.create(	
        user_id: User.first.id,	
        category: "to-do",	
        title: Faker::Marketing.buzzwords,	
        description: Faker::Hipster.sentence	
    )	
end 
5.times do	
    Notebook.create(	
        user_id: User.first.id,	
        category: "reminders",	
        title: Faker::Marketing.buzzwords,	
        description: Faker::Hipster.sentence	
    )	
end 	
puts 'First Notebook:'	
puts Notebook.first.to_json	


 200.times do	
    Note.create(	
        notebook_id: rand(1..10),	
        title: Faker::Marketing.buzzwords,	
        content: Faker::Hipster.sentence,	
        color: "#FFFFA5"	
    )	
end 	
puts 'First Note:'	
puts Note.first.to_json