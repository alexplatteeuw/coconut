# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.crea
puts 'destroy charity db'
Charity.destroy_all

puts 'Creating 2 new charitys'
charity = Charity.new
charity.name =  "les Restos du Coeur"
charity.description = "Fondés par Coluche en 1985, les Restos du Cœur est une association loi de 1901, reconnue d’utilité publique, sous le nom officiel de « les Restaurants du Cœur – les Relais du Cœur ». Ils ont pour but « d’aider et d’apporter une assistance bénévole aux personnes démunies, notamment dans le domaine alimentaire par l’accès à des repas gratuits, et par la participation à leur insertion sociale et économique, ainsi qu’à toute action contre la pauvreté sous toutes ses formes »."
charity.save!

charity = Charity.new
charity.name = "Médecins sans frontières"
charity.description = "depuis plus de 45 ans, Médecins Sans Frontières apporte une assistance médicale à des populations dont la vie ou la santé est menacée par des conflits armés, des épidémies, des pandémies ou des catastrophes naturelles."
charity.save!

puts 'destroy projects db'
Project.destroy_all

puts 'Creating 3 new projects'
project = Project.new
project.name = "Refonte du site internet"
project.description ="Le site internet des restos du coeur enregistre + de 10k visiteurs / jours. Pour coller à notre nouvelle imagne et notre nouvelle charte graphique nous souhaiterions être accompagnés pour la refonte de celui-ci. Nous recherchons des développeurs séniors qui peuvent nous accompagner et nous guider. Il faut que nos équipes en interne puisse lire ce code et mettre à jour le site. Le télétravail est possible mais nous préférerions une présence physique."
project.address = "4 Cité d'Hauteville 75010"
project.image_url = "https://upload.wikimedia.org/wikipedia/fr/thumb/a/ad/Restos_du_coeur_Logo.svg/1200px-Restos_du_coeur_Logo.svg.png"
project.video_url = "https://res.cloudinary.com/clemlemq/video/upload/v1593869121/Spot_d_appel_au_don_2018-2019_usf9gi.mp4"
project.charity = Charity.first
project.tag_list = "informatique, développement, moyen, web"
project.skill_list = "CSS, JS, Ruby"
project.save!

project = Project.new
project.name = "Refonte du cadre juridique"
project.description = "On a des problèmmes juridiques, help !!!"
project.address = "4 Cité d'Hauteville 75010"
project.image_url = ""
project.video_url = ""
project.charity = Charity.first
project.tag_list = "juridique, long"
project.skill_list = "Droit"
project.save!

project = Project.new
project.name = "Plateforme interne"
project.description = "Plateforme pour gérer nos adhérents Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo qui, architecto inventore officia, odio asperiores libero cum? Iusto consectetur odio officiis, ipsum maxime necessitatibus, tenetur deserunt tempora consequatur libero dolore."
project.address = "34 avenue Jean Jaurès"
project.image_url = ""
project.video_url = ""
project.charity = Charity.last
project.tag_list = "informatique, développement, long, intranet"
project.skill_list = "Python, React, JS, CSS, Ruby"
project.save!


puts "Drop company db"
Company.destroy_all

puts "Add a company"
company = Company.new
company.name = "Le Wagon"
company.address = "16 villa Gaudelet"
company.save!

puts "Drop users db"
User.destroy_all

puts "Add 2 users"
admin_user = User.new
admin_user.first_name = "Maxime"
admin_user.last_name = "Berthelot"
admin_user.email = "max@lewagon.org"
admin_user.password = "maxime"
admin_user.description = "j'ai un deug"
admin_user.admin = true
admin_user.company = Company.first
admin_user.address = "31 rue de citeaux, 75012"
admin_user.skill_list ="CSS, JS, Deug"
admin_user.save!

user = User.new
user.first_name = "Clément"
user.last_name = "Lemaire"
user.email = "clem@lewagon.org"
user.password = "clement"
user.description = "Je connais le setup par coeur"
user.admin = false
user.address = "25 rue du javelot, 75013"
user.skill_list = "CSS, JS, Setup"
user.company = Company.first
user.save!

reservation = Reservation.new
reservation.user = user
reservation.project = project
reservation.save!
