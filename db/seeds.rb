# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Clinique
user = User.create(email: "admin@mail.com", password: "password")



# Seed Clinique
Clinique.create(id: 1, nom: "NC", veterinaires: "", mail: "")
Clinique.create(id: 21, nom: "Drs Alasnier", veterinaires: "", mail: "v.alasnier@wanadoo.fr")
Clinique.create(id: 22, nom: "Dr Blain", veterinaires: "", mail: "dany.blain@sfr.fr")
Clinique.create(id: 23, nom: "Drs Bosquet-Picot", veterinaires: "", mail: "picot_francoise@orange.fr")
Clinique.create(id: 24, nom: "Clin. de Lamballe", veterinaires: "Bouty; Auguin", mail: "cliniquedelamballe@orange.fr")
Clinique.create(id: 25, nom: "Clin. St Jean", veterinaires: "Blanc; Cassan", mail: "clivetsaintjean@orange.fr")
Clinique.create(id: 26, nom: "Dr. Debricon", veterinaires: "", mail: "sophie.debricon@orange.fr ")
Clinique.create(id: 27, nom: "Clin. de la tangentielle", veterinaires: "Gaspar ", mail: "clinique-tangentielle@veterinaire.fr")
Clinique.create(id: 28, nom: "Clin. de la Cigogne", veterinaires: "Guillet; Bouriez", mail: "veto.bouriez@orange.fr")
Clinique.create(id: 29, nom: "Dr. Huck", veterinaires: "", mail: "huck-kouvtanovitch@orange.fr")
Clinique.create(id: 31, nom: "Dr Laverrière", veterinaires: "", mail: "clin.vet.garenne@gmail.com")
Clinique.create(id: 32, nom: "Clin. De la tuilerie", veterinaires: "Marçais; Mangold", mail: "mangold.marcais@wanadoo.fr")
Clinique.create(id: 33, nom: "Clin. des Glycines", veterinaires: "Mathet; Laizeau; Combet; Boissay ", mail: "asv@cliniqueveterinaire_lesglycines.com")
Clinique.create(id: 34, nom: "Clin. de Beauvoir", veterinaires: "Molvot; Laurent", mail: "clinvetbeauvoir@yahoo.fr")
Clinique.create(id: 35, nom: "Clin. des Acacias", veterinaires: "Poisson; Paillassou; Bouvier;Arinal", mail: "contact@vetacacias.com")
Clinique.create(id: 36, nom: "Clin. de la Guignadière", veterinaires: "Spilliaert; Cassan", mail: "serge.spilliaert@wanadoo.fr ")
Clinique.create(id: 37, nom: "Clin. d'Artois", veterinaires: "Valat; Petit", mail: "clivetartois@orange.fr")
Clinique.create(id: 38, nom: "Clin. Ligéria", veterinaires: "Vidal; Menez; Goin", mail: "cliniqueligeria@gmail.com")
Clinique.create(id: 39, nom: "Clin. des Coutures", veterinaires: "Lalange; LeChien", mail: "cliniquecoutures@wanadoo.fr")
Clinique.create(id: 40, nom: "Clin. des Portes de Tavers", veterinaires: "Gerbet", mail: "vetobeaugency@orange.fr")
Clinique.create(id: 42, nom: "Hors SOS Véto", veterinaires: "", mail: "")
Clinique.create(id: 43, nom: "Dispensaire SPA", veterinaires: "", mail: "orleans@spa.asso.fr")
Clinique.create(id: 44, nom: "Clin. Samatha", veterinaires: "Charrière", mail: "cabinet.veterinaire.samatha@gmail.com")

#Seed Gardes
Garde.create(id: 1, titre: "15 Aout (du 14 du 16 aout 2017)")
Garde.create(id: 2, titre: "Nuit du 01 au 02 Juin 2016")
Garde.create(id: 3, titre: "Nuit du 03 au 04 Aout 2017")
Garde.create(id: 49, titre: "We du 12 au 13 Mai 2018")


#Seed Faker

20.times do
  Consultation.create(client_clinique_id: Clinique.all.pluck(:id).sample, garde: Garde.all.sample ,client_nom:Faker::Name.name ,client_adresse:Faker::Address.full_address, client_ville:  Faker::Address.city, client_telephone:  Faker::PhoneNumber.phone_number, client_mail:Faker::Internet.email,animal_nom:Faker::Dog.name,animal_espece:"Chien",animal_ageA:(1..10).to_a.sample,animal_ageM:0,animal_sexe:["Male","Female"].sample,consultation_motif: Faker::Lorem.paragraph ,consultation_commentaires:Faker::Lorem.paragraph,consultation_suites:Faker::Lorem.paragraph)
end



