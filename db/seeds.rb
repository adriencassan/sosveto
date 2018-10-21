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
Profile.create(role: "clinique", last_name: "NC")
Profile.create(role: "clinique", last_name: "Drs Alasnier")
Profile.create(role: "clinique", last_name: "Dr Blain")
Profile.create(role: "clinique", last_name: "Drs Bosquet-Picot")
Profile.create(role: "clinique", last_name: "Clin. de Lamballe")
Profile.create(role: "clinique", last_name: "Clin. St Jean")
Profile.create(role: "clinique", last_name: "Dr. Debricon")
Profile.create(role: "clinique", last_name: "Clin. de la tangentielle")
Profile.create(role: "clinique", last_name: "Clin. de la Cigogne")
Profile.create(role: "clinique", last_name: "Dr. Huck")
Profile.create(role: "clinique", last_name: "Dr Laverrière")
Profile.create(role: "clinique", last_name: "Clin. De la tuilerie")
Profile.create(role: "clinique", last_name: "Clin. des Glycines")
Profile.create(role: "clinique", last_name: "Clin. de Beauvoir")
Profile.create(role: "clinique", last_name: "Clin. des Acacias")
Profile.create(role: "clinique", last_name: "Clin. de la Guignadière")
Profile.create(role: "clinique", last_name: "Clin. d'Artois")
Profile.create(role: "clinique", last_name: "Clin. Ligéria")
Profile.create(role: "clinique", last_name: "Clin. des Coutures")
Profile.create(role: "clinique", last_name: "Clin. des Portes de Tavers")
Profile.create(role: "clinique", last_name: "Hors SOS Véto")
Profile.create(role: "clinique", last_name: "Dispensaire SPA")
Profile.create(role: "clinique", last_name: "Clin. Samatha")

#Seed Gardes
Duty.create(title: "15 Aout (du 14 du 16 aout 2017)", clinic: Profile.where(role: "clinique").sample, date_start: "14/08/17", date_end: "16/08/17")
Duty.create(title: "Nuit du 01 au 02 Juin 2016", clinic: Profile.where(role: "clinique").sample, date_start: "01/02/16", date_end: "02/06/16")
Duty.create(title: "Nuit du 03 au 04 Aout 2017", clinic: Profile.where(role: "clinique").sample, date_start: "03/08/17", date_end: "04/08/17")
Duty.create(title: "We du 12 au 13 Mai 2018", clinic: Profile.where(role: "clinique").sample, date_start: "12/05/18", date_end: "13/05/18")


#Seed Faker
20.times do
 ### TODO Profile.create(role: client...)
end


20.times do
  Consultation.create(duty: Duty.all.sample ,client_nom:Faker::Name.name ,client_adresse:Faker::Address.full_address, client_ville:  Faker::Address.city, client_telephone:  Faker::PhoneNumber.phone_number, client_mail:Faker::Internet.email,animal_nom:Faker::Dog.name,animal_espece:"Chien",animal_ageA:(1..10).to_a.sample,animal_ageM:0,animal_sexe:["Male","Female"].sample,consultation_motif: Faker::Lorem.paragraph ,consultation_commentaires:Faker::Lorem.paragraph,consultation_suites:Faker::Lorem.paragraph)
end


# Event
Event.create(title: "Bienvenue sur sos-veto !", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis enim dicta eum dolores sapiente nesciunt dolorem quaerat minus veniam ratione quam placeat in eligendi, vero dolorum voluptatem, deserunt vel libero?")


