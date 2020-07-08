puts 'Cleaning DB ...'

Reservation.destroy_all
Charity.destroy_all
Project.destroy_all
Company.destroy_all
User.destroy_all

puts 'Creating 2 charities ...'

charity = Charity.new
charity.name =  "les Restos du Coeur"
charity.description = "Fondés par Coluche en 1985, les Restos du Cœur est une association loi de 1901, reconnue d’utilité publique, sous le nom officiel de « les Restaurants du Cœur – les Relais du Cœur ». Ils ont pour but « d’aider et d’apporter une assistance bénévole aux personnes démunies, notamment dans le domaine alimentaire par l’accès à des repas gratuits, et par la participation à leur insertion sociale et économique, ainsi qu’à toute action contre la pauvreté sous toutes ses formes »."
charity.save!

charity = Charity.new
charity.name = "Médecins sans frontières"
charity.description = "Depuis plus de 45 ans, Médecins Sans Frontières apporte une assistance médicale à des populations dont la vie ou la santé est menacée par des conflits armés, des épidémies, des pandémies ou des catastrophes naturelles."
charity.save!

puts 'Charities created!'

puts 'Creating 3 projects belonging to the same charity...'

project = Project.new
project.name = "Refonte du site internet"
project.description ="Le site internet des restos du coeur enregistre + de 10k visiteurs / jours. Pour coller à notre nouvelle imagne et notre nouvelle charte graphique nous souhaiterions être accompagnés pour la refonte de celui-ci. Nous recherchons des développeurs séniors qui peuvent nous accompagner et nous guider. Il faut que nos équipes en interne puisse lire ce code et mettre à jour le site. Le télétravail est possible mais nous préférerions une présence physique."
project.address = "4 Cité d'Hauteville 75010"
project.image_url = "https://upload.wikimedia.org/wikipedia/fr/thumb/a/ad/Restos_du_coeur_Logo.svg/1200px-Restos_du_coeur_Logo.svg.png"
project.video_url = "https://res.cloudinary.com/clemlemq/video/upload/v1593869121/Spot_d_appel_au_don_2018-2019_usf9gi.mp4"
project.charity = Charity.first
project.tag_list = "informatique, développement, moyen, web"
project.save!

project = Project.new
project.name = "Refonte du cadre juridique"
project.description = "On a des problèmmes juridiques, help !!!"
project.address = "4 Cité d'Hauteville 75010"
project.image_url = ""
project.video_url = ""
project.charity = Charity.first
project.tag_list = "juridique, long"
project.save!

project = Project.new
project.name = "Plateforme interne"
project.description = "Plateforme pour gérer nos adhérents Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo qui, architecto inventore officia, odio asperiores libero cum? Iusto consectetur odio officiis, ipsum maxime necessitatibus, tenetur deserunt tempora consequatur libero dolore."
project.address = "34 avenue Jean Jaurès"
project.image_url = ""
project.video_url = ""
project.charity = Charity.last
project.tag_list = "informatique, développement, long, intranet"
project.save!

puts "Drop company db"
Company.destroy_all

puts 'Projects created!'

puts 'Creating a company...'

company = Company.new
company.name = "Coconut"
company.address = "16 villa Gaudelet"
company.save!

puts 'Creating 2 users belonging to the same company...'

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
admin_user.avatar_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1581162961/elniwt7txfiooiujd3ew.jpg"
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
user.avatar_url = "https://avatars3.githubusercontent.com/u/60347959?v=4"
user.save!


reservation = Reservation.new
reservation.user = user
reservation.project = project
reservation.save!

puts 'Users created!'

