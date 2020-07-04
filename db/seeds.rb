puts 'Cleaning DB ...'

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
project.name = "Site internet"
project.description ="Je veux refaire mon site"
project.address = "4 Cité d'Hauteville 75010"
project.charity = Charity.first
project.tag_list = "informatique, développement, moyen, web"
project.skill_list = "CSS, JS, Ruby"
project.save!

project = Project.new
project.name = "Refonte du cadre juridique"
project.description = "On a des problèmmes juridiques, help !!!"
project.address = "4 Cité d'Hauteville 75010"
project.charity = Charity.first
project.tag_list = "juridique, long"
project.skill_list = "Droit"
project.save!

project = Project.new
project.name = "Plateforme interne"
project.description = "Plateforme pour gérer nos adhérents"
project.address = "34 avenue Jean Jaurès"
project.charity = Charity.last
project.tag_list = "informatique, développement, long, intranet"
project.skill_list = "Python, React, JS, CSS, Ruby"
project.save!

puts 'Projects created!'

puts 'Creating a company...'

company = Company.new
company.name = "Le Wagon"
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

puts 'Users created!'
