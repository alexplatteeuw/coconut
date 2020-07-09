puts 'Cleaning DB ...'

Reservation.destroy_all
Charity.destroy_all
Project.destroy_all
Company.destroy_all
User.destroy_all

puts 'Creating 4 charities ...'

charity = Charity.new
charity.name =  "Les Restos du Coeur"
charity.description = "Les Restaurants du cœur – Les Relais du cœur, connus sous le nom de Les Restos du cœur, sont une association loi de 1901 à but non lucratif et reconnue d'utilité publique, créée en France par Coluche en 1985. Cette association a pour particularité d'avoir bénéficié du soutien de plusieurs personnalités françaises, dès ses débuts, et d'une vaste médiatisation, ce qui retient l'attention de la classe politique, permet d'établir de nouvelles lois, et attire la participation de nombreux bénévoles."
charity.logo = "https://seeklogo.com/images/L/Les_Restaurants_Du_Coeur-logo-6D68AF4C59-seeklogo.com.png"
charity.save!

charity = Charity.new
charity.name = "Greenpeace"
charity.description = "Greenpeace est une organisation non gouvernementale internationale (ONGI) de protection de l'environnement présente dans plus de 55 pays à travers le monde1. Fondée en 1971, par Jim Bohlen et Irving Stowe, après le mouvement Don't Make a Wave Committee visant à s'opposer aux essais nucléaires aux États-Unis, l’organisation Greenpeace est un groupe de plaidoyer luttant contre ce qu'elle estime être les plus grandes menaces pour l'environnement et la biodiversité sur la planète."
charity.logo = "https://upload.wikimedia.org/wikipedia/fr/thumb/6/69/MSF.svg/1200px-MSF.svg.png"
charity.save!

charity = Charity.new
charity.name = "Médecins du monde"
charity.description = "Médecins du Monde est une ONG médicale de solidarité internationale créée en 1980. Elle intervient en France et à l’international, afin de soigner les populations les plus vulnérables, les victimes de conflits armés, de catastrophes naturelles, celles et ceux qui n’ont pas accès aux soins, celles et ceux que le monde oublie peu à peu. Association humanitaire indépendante, Médecins du Monde agit au-delà du soin. Elle dénonce les atteintes à la dignité et aux droits humains et plaide pour améliorer la situation des personnes vulnérables."
charity.logo = "https://www.medecinsdumonde.org/sites/all/themes/mdm2/logo.png"
charity.save!

charity = Charity.new
charity.name = "Oxfam France"
charity.description = "Oxfam est une organisation internationale de développement qui a pour objectif de mobiliser le pouvoir citoyen contre la pauvreté. Oxfam travaille dans plus de 90 pays afin de trouver des solutions durables pour mettre fin aux injustices qui engendrent la pauvreté."
charity.logo = "https://vectorlogoseek.com/wp-content/uploads/2019/06/oxfam-vector-logo.png"
charity.save!

puts 'Charities created!'

puts 'Creating 3 projects belonging to the same charity...'

project = Project.new
project.name = "Refonte du site internet"
project.description ="Le site internet des restos du coeur enregistre plus de 10 000 visites uniques par jour. Pour coller à notre nouvelle imagne et notre nouvelle charte graphique nous souhaiterions être accompagnés pour la refonte de celui-ci. Nous recherchons des développeurs séniors qui peuvent nous accompagner et nous guider. Il faut que nos équipes en interne puisse lire ce code et mettre à jour le site. Le télétravail est possible mais nous préférerions une présence physique."
project.address = "4 Cité d'Hauteville 75010 Paris"
project.image_url = "https://upload.wikimedia.org/wikipedia/fr/thumb/a/ad/Restos_du_coeur_Logo.svg/1200px-Restos_du_coeur_Logo.svg.png"
project.video_url = "https://res.cloudinary.com/clemlemq/video/upload/v1593869121/Spot_d_appel_au_don_2018-2019_usf9gi.mp4"
project.charity = Charity.where(name: "Les Restos du Coeur").first
project.tag_list = "Informatique, Web, Design"
project.status = "current"
project.save!

project = Project.new
project.name = "Refonte des statuts de l'association"
project.description = "A la suite de restructurations internes, les statuts de l'association Médecins du Monde nécessitent une refonte globale. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo qui, architecto inventore officia, odio asperiores libero cum? Iusto consectetur odio officiis, ipsum maxime necessitatibus, tenetur deserunt tempora consequatur libero dolore."
project.address = "4 Cité d'Hauteville 75010 Paris"
project.image_url = "https://upload.wikimedia.org/wikipedia/fr/thumb/a/ad/Restos_du_coeur_Logo.svg/1200px-Restos_du_coeur_Logo.svg.png"
project.video_url = "https://res.cloudinary.com/clemlemq/video/upload/v1593869121/Spot_d_appel_au_don_2018-2019_usf9gi.mp4"
project.charity = Charity.where(name: "Médecins du monde").first
project.tag_list = "Juridique, Loi 1901"
project.status = "unstarted"
project.save!

project = Project.new
project.name = "Communication interne"
project.description = "Campagne de communication interne, lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo qui, architecto inventore officia, odio asperiores libero cum? Iusto consectetur odio officiis, ipsum maxime necessitatibus, tenetur deserunt tempora consequatur libero dolore."
project.address = "34 avenue Jean Jaurès 75019 Paris"
project.image_url = "https://upload.wikimedia.org/wikipedia/fr/thumb/a/ad/Restos_du_coeur_Logo.svg/1200px-Restos_du_coeur_Logo.svg.png"
project.video_url = "https://res.cloudinary.com/clemlemq/video/upload/v1593869121/Spot_d_appel_au_don_2018-2019_usf9gi.mp4"
project.charity = Charity.where(name: "Greenpeace").first
project.tag_list = "RH, Communication, Design"
project.status = "completed"
project.save!

puts 'Projects created!'

puts 'Creating a company...'

company = Company.new
company.name = "Coconut"
company.address = "16 villa Gaudelet 75011 Paris"
company.save!

puts 'Company created!'

puts 'Creating 2 users belonging to the same company...'

admin_user = User.new
admin_user.first_name = "Maxime"
admin_user.last_name = "Berthelot"
admin_user.email = "max@lewagon.org"
admin_user.password = "maxime"
admin_user.description = "Chargé de ressources humaines passionné de scooters électriques"
admin_user.job = "RH"
admin_user.admin = true
admin_user.company = Company.first
admin_user.address = "31 rue de citeaux, 75012"
admin_user.skill_list ="Recrutement, Jobboard, Gestion de paie"
admin_user.avatar_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1581162961/elniwt7txfiooiujd3ew.jpg"
admin_user.save!

user = User.new
user.first_name = "Clément"
user.last_name = "Lemaire"
user.email = "clem@lewagon.org"
user.password = "clement"
user.description = "Ingénieur informatique qui connaît par coeur le setup du Wagon"
user.job = "Ingénieur informatique"
user.admin = false
user.address = "25 rue du javelot 75013 Paris"
user.skill_list = "CSS, JS, Design"
user.company = Company.first
user.avatar_url = "https://avatars3.githubusercontent.com/u/60347959?v=4"
user.save!

puts 'Users created!'

puts 'Creating a reservation...'

reservation = Reservation.new
reservation.user = user
reservation.project = project
reservation.save!

puts 'Reservation created!'

