# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Clinique
user1 = User.create(email: "admin@mail.com", password: "password")
user2 = User.create(email: "veto1@mail.com", password: "password")
user3 = User.create(email: "veto2@mail.com", password: "password")

profile1 = Profile.create(user: user1, role: "admin", first_name: "Admin", last_name: "Admin", admin: true)
profile2 = Profile.create(user: user2, role: "veterinaire", first_name: "Veterinaire 1", last_name: "Veterinaire 1")
profile3 = Profile.create(user: user3, role: "veterinaire", first_name: "Veterinaire 2", last_name: "Veterinaire 2")

# Seed Clinique
Profile.create(role: "clinique", last_name: "NC", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Drs Alasnier", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Dr Blain", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Drs Bosquet-Picot", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. de Lamballe", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. St Jean", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Dr. Debricon", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. de la tangentielle", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. de la Cigogne", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Dr. Huck", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Dr Laverrière", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. De la tuilerie", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. des Glycines", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. de Beauvoir", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. des Acacias", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. de la Guignadière", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. d'Artois", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. Ligéria", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. des Coutures", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. des Portes de Tavers", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Hors SOS Véto", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Dispensaire SPA", adr_city: "Orléans")
Profile.create(role: "clinique", last_name: "Clin. Samatha", adr_city: "Orléans")

#Seed Gardes
Duty.create(title: "15 Aout (du 14 du 16 aout 2017)", clinic: Profile.where(role: "clinique").sample, date_start: "14/08/2017", date_end: "16/08/2017")
Duty.create(title: "Nuit du 01 au 02 Juin 2016", clinic: Profile.where(role: "clinique").sample, date_start: "01/02/2016", date_end: "02/06/2016")
Duty.create(title: "Nuit du 03 au 04 Aout 2017", clinic: Profile.where(role: "clinique").sample, date_start: "03/08/2017", date_end: "04/08/2017")
Duty.create(title: "We du 12 au 13 Mai 2018", clinic: Profile.where(role: "clinique").sample, date_start: "12/05/2018", date_end: "13/05/2018")


#Seed Faker



# Create Clients
5.times do
 Profile.create(role: "client", last_name: Faker::Name.name, adr_line1: Faker::Address.full_address, adr_city: Faker::Address.city, client_gender:["Male","Femelle"].sample, email:Faker::Internet.email )
end

# Create Pets
6.times do
 Profile.create(role: "animal", last_name: Faker::Dog.name, pet_specie: ["Chien","Chat","Lapin"].sample, pet_age: (1..10).to_a.sample, pet_gender:["Male","Femelle"].sample, clinic: Profile.where(role: "clinique").sample, pet_owner: Profile.where(role: "client").sample  )
end


20.times do
  Consultation.create(duty: Duty.all.sample , pet: Profile.where(role: "animal").sample, client: Profile.where(role: "client").sample  ,consultation_motif: Faker::Lorem.paragraph ,consultation_commentaires:Faker::Lorem.paragraph,consultation_suites:Faker::Lorem.paragraph)
end


# Event
Event.create(title: "Bienvenue sur sos-veto !", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis enim dicta eum dolores sapiente nesciunt dolorem quaerat minus veniam ratione quam placeat in eligendi, vero dolorum voluptatem, deserunt vel libero?")


