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
Clinique.create(nom: "NC", veterinaires: "", email: "")
Clinique.create(nom: "Drs Alasnier", veterinaires: "", email: "v.alasnier@wanadoo.fr")
Clinique.create(nom: "Dr Blain", veterinaires: "", email: "dany.blain@sfr.fr")
Clinique.create(nom: "Drs Bosquet-Picot", veterinaires: "", email: "picot_francoise@orange.fr")
Clinique.create(nom: "Clin. de Lamballe", veterinaires: "Bouty; Auguin", email: "cliniquedelamballe@orange.fr")
Clinique.create(nom: "Clin. St Jean", veterinaires: "Blanc; Cassan", email: "clivetsaintjean@orange.fr")
Clinique.create(nom: "Dr. Debricon", veterinaires: "", email: "sophie.debricon@orange.fr ")
Clinique.create(nom: "Clin. de la tangentielle", veterinaires: "Gaspar ", email: "clinique-tangentielle@veterinaire.fr")
Clinique.create(nom: "Clin. de la Cigogne", veterinaires: "Guillet; Bouriez", email: "veto.bouriez@orange.fr")
Clinique.create(nom: "Dr. Huck", veterinaires: "", email: "huck-kouvtanovitch@orange.fr")
Clinique.create(nom: "Dr Laverrière", veterinaires: "", email: "clin.vet.garenne@gemail.com")
Clinique.create(nom: "Clin. De la tuilerie", veterinaires: "Marçais; Mangold", email: "mangold.marcais@wanadoo.fr")
Clinique.create(nom: "Clin. des Glycines", veterinaires: "Mathet; Laizeau; Combet; Boissay ", email: "asv@cliniqueveterinaire_lesglycines.com")
Clinique.create(nom: "Clin. de Beauvoir", veterinaires: "Molvot; Laurent", email: "clinvetbeauvoir@yahoo.fr")
Clinique.create(nom: "Clin. des Acacias", veterinaires: "Poisson; Paillassou; Bouvier;Arinal", email: "contact@vetacacias.com")
Clinique.create(nom: "Clin. de la Guignadière", veterinaires: "Spilliaert; Cassan", email: "serge.spilliaert@wanadoo.fr ")
Clinique.create(nom: "Clin. d'Artois", veterinaires: "Valat; Petit", email: "clivetartois@orange.fr")
Clinique.create(nom: "Clin. Ligéria", veterinaires: "Vidal; Menez; Goin", email: "cliniqueligeria@gemail.com")
Clinique.create(nom: "Clin. des Coutures", veterinaires: "Lalange; LeChien", email: "cliniquecoutures@wanadoo.fr")
Clinique.create(nom: "Clin. des Portes de Tavers", veterinaires: "Gerbet", email: "vetobeaugency@orange.fr")
Clinique.create(nom: "Hors SOS Véto", veterinaires: "", email: "")
Clinique.create(nom: "Dispensaire SPA", veterinaires: "", email: "orleans@spa.asso.fr")
Clinique.create(nom: "Clin. Samatha", veterinaires: "Charrière", email: "cabinet.veterinaire.samatha@gmail.com")

#Seed Gardes
Garde.create(id: 1, titre: "15 Aout (du 14 du 16 aout 2017)")
Garde.create(id: 2, titre: "Nuit du 01 au 02 Juin 2016")
Garde.create(id: 3, titre: "Nuit du 03 au 04 Aout 2017")
Garde.create(id: 49, titre: "We du 12 au 13 Mai 2018")


#Seed Faker
20.times do
  Consultation.create(client_clinique_id: Clinique.all.pluck(:id).sample, garde: Garde.all.sample ,client_nom:Faker::Name.name ,client_adresse:Faker::Address.full_address, client_ville:  Faker::Address.city, client_telephone:  Faker::PhoneNumber.phone_number, client_mail:Faker::Internet.email,animal_nom:Faker::Dog.name,animal_espece:"Chien",animal_ageA:(1..10).to_a.sample,animal_ageM:0,animal_sexe:["Male","Female"].sample,consultation_motif: Faker::Lorem.paragraph ,consultation_commentaires:Faker::Lorem.paragraph,consultation_suites:Faker::Lorem.paragraph)
end


# Event
Event.create(title: "Bienvenue sur sos-veto !", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis enim dicta eum dolores sapiente nesciunt dolorem quaerat minus veniam ratione quam placeat in eligendi, vero dolorum voluptatem, deserunt vel libero?")


