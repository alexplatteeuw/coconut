puts 'Cleaning DB ...'

Reservation.destroy_all
Charity.destroy_all
Chatroom.destroy_all
Project.destroy_all
Company.destroy_all
User.destroy_all

puts 'Creating charities ...'

charity = Charity.new
charity.name =  "Les Restos du Coeur"
charity.description = "Les Restaurants du cœur – Les Relais du cœur, connus sous le nom de Les Restos du cœur, sont une association loi de 1901 à but non lucratif et reconnue d'utilité publique, créée en France par Coluche en 1985. Cette association a pour particularité d'avoir bénéficié du soutien de plusieurs personnalités françaises, dès ses débuts, et d'une vaste médiatisation, ce qui retient l'attention de la classe politique, permet d'établir de nouvelles lois, et attire la participation de nombreux bénévoles."
charity.logo = "https://seeklogo.com/images/L/Les_Restaurants_Du_Coeur-logo-6D68AF4C59-seeklogo.com.png"
charity.save!

charity = Charity.new
charity.name = "Médecins Sans Frontière"
charity.description = "Médecins Sans Frontière est une organisation non gouvernementale internationale (ONGI) de protection de l'environnement présente dans plus de 55 pays à travers le monde1. Fondée en 1971, par Jim Bohlen et Irving Stowe, après le mouvement Don't Make a Wave Committee visant à s'opposer aux essais nucléaires aux États-Unis, l’organisation Greenpeace est un groupe de plaidoyer luttant contre ce qu'elle estime être les plus grandes menaces pour l'environnement et la biodiversité sur la planète."
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

charity = Charity.new
charity.name = "WWF"
charity.description = "Le WWF ou Fonds mondial pour la nature est une organisation non gouvernementale internationale créée en 1961, vouée à la protection de l'environnement et au développement durable."
charity.logo = "https://upload.wikimedia.org/wikipedia/fr/thumb/7/79/WWF_logo_2000.svg/1200px-WWF_logo_2000.svg.png"
charity.save!

charity = Charity.new
charity.name = "Sea shepherd"
charity.description = "La Sea Shepherd Conservation Society est une organisation non gouvernementale internationale maritime à but non lucratif, vouée à la protection des écosystèmes marins et de la biodiversité. La Sea Shepherd Conservation Society désigne l'antenne américaine de Sea Shepherd."
charity.logo = "https://img2.freepng.fr/20180821/ffa/kisspng-sea-shepherd-conservation-society-organization-nep-5b7bdd80843ce9.8373910715348442885417.jpg"
charity.save!

charity = Charity.new
charity.name = "Perce Neige"
charity.description = "Perce-Neige créée en 1966 à l'initiative de l'acteur Lino Ventura et de sa femme Odette pour venir en aide aux personnes handicapées mentales est devenue fondation reconnue d'utilité publique par décret du 13 mai 2016."
charity.logo = "https://www.perce-neige.org/wp-content/themes/perceneige/assets/images/menu-mobile-logo.svg"
charity.save!


puts 'Charities created!'

puts 'Creating projects belonging to the same charity...'


project = Project.new
project.name = "Rachat d'une autre association"
project.description = "Dans le cadre du rachat d'une autre association, nous aurions besoin de conseil et d'aide pour rédiger l'ensemble des contrats et des nouveaux statuts juridiques"
project.charity = Charity.where(name: "Sea shepherd").first
project.skill_list = "Juridique, Conseil, Redaction"
project.tache = "Contacter les avocats"
project.status = "pending"
project.save!

project = Project.new
project.name = "Refonte des statuts de l'association"
project.description = "A la suite de restructurations internes, les statuts de l'association Médecins du Monde nécessitent une refonte globale. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo qui, architecto inventore officia, odio asperiores libero cum? Iusto consectetur odio officiis, ipsum maxime necessitatibus, tenetur deserunt tempora consequatur libero dolore."
project.charity = Charity.where(name: "Médecins du monde").first
project.skill_list = "Juridique, Loi 1901"
project.tache = "Vérifier la jurisprudence"
project.status = "created"
project.nbtaches = "2"
project.save!

project = Project.new
project.name = "Construction de l'intranet"
project.description = "Dans le cadre d'une grosse campagne de communication interne, nous souhaitons refondre totalement notre intranet avec un design moderne et des supers fonctionnalités"
project.charity = Charity.where(name: "Médecins Sans Frontière").first
project.skill_list = "RH, Communication, Design, Web"
project.tache = "Contacter le gestionnaire de réseau"
project.status = "created"
project.nbtaches = "11"
project.save!




project = Project.new
project.name = "Chargé de mission - controle de gestion logistique"
project.description ="Au sein des services financiers du siège des Restaurants du Cœur, la cellule gestion est en
lien avec les 117 associations départementales (AD) sur toutes les questions financières,
gestion et paie.
A ce titre, elle assure des missions variées : audit de gestion des AD, production des
plaquettes des comptes annuels des AD, contrôle budgétaire et contrôle de gestion, contrôle
des paies, élaboration de procédures…
Le service est actuellement structuré en six pôles : audit, budget/gestion, comptabilité,
formation, paie, procédures.
Le chef de mission logistique sera en liaison permanente avec les autres services du siège,
notamment le pôle alimentaire, mais aussi avec les AD.

Les missions:
- accompagner les opérationnels dans l’optimisation des processus de stockage et de
gestion des flux de marchandises des Restos du Cœur (environnement multi-sites)
- apporter de la visibilité à l’organisation quant à l'activité de ses sites logistiques (AN/AD)
et mettre à la disposition des opérationnels (pôle alimentaire et responsables Appros des
AD) des outils de pilotage adaptés de façon à comprendre, soutenir et optimiser le
développement de l’activité logistique
- participer activement à l’optimisation du système d’information de gestion et à la mise en
place d’outils lui permettant de mener à bien ses tâches

Lieu de la mission: au siège de l’Association Nationale des Restos du Cœur : 42, rue de Clichy – 75009 Paris."
project.charity = Charity.where(name: "Les Restos du Coeur").first
project.skill_list = "Informatique, Gestion, Logistique"
project.tache = "Lancer le kick off"
project.status = "created"
project.nbtaches = "10"
project.save!

project = Project.new
project.name = "Aide à la personne"
project.description = "Nous cherchons des volontaires pour nous aider à rendre des services aux membres de l'association : déménagement, ménage, administratif"
project.charity = Charity.where(name: "Perce Neige").first
project.skill_list = "Temps, Ménage, administratif"
project.tache = "Réserver son créneau"
project.status = "created"
project.nbtaches = "8"
project.save!

project = Project.new
project.name = "Création d'une application mobile"
project.description = "Afin de mettre en avant une nouvelle branche de l'association, nous souhaitons créer une application mobile pour être au plus proche de nos users"
project.charity = Charity.where(name: "WWF").first
project.skill_list = "Web, Conseil, Design"
project.tache = "Publier sur l'Apple store"
project.status = "created"
project.nbtaches = "3"
project.save!

project = Project.new
project.name = "Chef de projet Intranet"
project.description ="Les Restos du Cœur animent une communauté de 70 000 bénévoles en France. Ces bénévoles sont actifs dans plus de 2 000 centres d’activité, eux-mêmes rattachés à 117
associations départementales. L’accès et le partage d’information est une préoccupation
quotidienne des Restos du Cœur. Plusieurs outils sont déjà en place. Parmi eux, un intranet
est en cours de refonte.

Le chef de projet doit avant tout avoir une capacité à coordonner, ce n’est pas un intervenant
technique, même si la compréhension de l’intérêt de l’intranet est un préalable.

Lieu de la mission: au siège de l’Association Nationale des Restos du Cœur : 42, rue de Clichy – 75009 Paris."
project.charity = Charity.where(name: "Les Restos du Coeur").first
project.skill_list = "Informatique, Web, Design"
project.tache = "Créer formulaire de contact"
project.status = "created"
project.nbtaches = "8"
project.save!


project = Project.new
project.name = "Completed2"
project.description = "Completed2"
project.charity = Charity.where(name: "Sea shepherd").first
project.skill_list = "Juridique, Conseil, Redaction"
project.tache = "Contacter les avocats"
project.status = "completed"
project.nbtaches = "4"
project.save!

project = Project.new
project.name = "Completed1"
project.description = "Completed1"
project.charity = Charity.where(name: "Sea shepherd").first
project.skill_list = "Juridique, Conseil, Redaction"
project.tache = "Contacter les avocats"
project.status = "completed"
project.save!

project = Project.new
project.name = "Completed3"
project.description = "Completed3"
project.charity = Charity.where(name: "Sea shepherd").first
project.skill_list = "Juridique, Conseil, Redaction"
project.tache = "Contacter les avocats"
project.status = "completed"
project.save!

project = Project.new
project.name = "Completed4"
project.description = "Completed4"
project.charity = Charity.where(name: "Sea shepherd").first
project.skill_list = "Juridique, Conseil, Redaction"
project.tache = "Contacter les avocats"
project.status = "completed"
project.save!

project = Project.new
project.name = "Completed5"
project.description = "Completed5"
project.charity = Charity.where(name: "Sea shepherd").first
project.skill_list = "Juridique, Conseil, Redaction"
project.tache = "Contacter les avocats"
project.status = "completed"
project.save!


puts 'Projects created!'

puts 'Creating companies...'

company = Company.new
company.name = "Instagram"
company.save!

company = Company.new
company.name = "Pixel me"
company.save!

company = Company.new
company.name = "Monoprix"
company.save!

company = Company.new
company.name = "Quiiet"
company.save!

company = Company.new
company.name = "Bergamotte"
company.save!

puts 'Companies created!'

puts 'Creating users...'

admin_user = User.new
admin_user.first_name = "Maxime"
admin_user.last_name = "Berthelot"
admin_user.email = "max@lewagon.org"
admin_user.password = "maxime"
admin_user.description = "Développeur passionné de scooters électriques & company"
admin_user.job = "RH"
admin_user.admin = false
admin_user.company = Company.first
admin_user.address = "31 rue de citeaux, 75012"
admin_user.skill_list ="Recrutement, Jobboard, Gestion de paie"
admin_user.avatar_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1581162961/elniwt7txfiooiujd3ew.jpg"
admin_user.save!

user = User.new
user.first_name = "Pauline"
user.last_name = "Paris"
user.email = "pauline@lewagon.org"
user.password = "pauline"
user.description = "Meuf trop sympa"
user.job = "RH"
user.admin = true
user.address = "25 rue des boulets"
user.skill_list = "CSS, JS, Design"
user.company = Company.first
user.avatar_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1586873952/kfn110hfwqteucjluzwx.jpg"
user.credits = 40
user.save!

user = User.new
user.first_name = "Clément"
user.last_name = "Lemaire"
user.email = "clem@lewagon.org"
user.password = "clement"
user.description = "Ingénieur informatique qui connaît par coeur le setup du Wagon"
user.job = "Developpeur"
user.admin = false
user.address = "25 rue du javelot 75013 Paris"
user.skill_list = "CSS, JS, Design"
user.company = Company.first
user.avatar_url = "https://avatars3.githubusercontent.com/u/60347959?v=4"
user.credits = 40
user.save!

user = User.new
user.first_name = "Barthélémy"
user.last_name = "Boillot"
user.email = "barthelemy@lewagon.org"
user.password = "barthelemy"
user.description = "King de l'algo ayant le coeur sur la main"
user.job = "Dev Fullstack"
user.admin = true
user.address = "45 avenue de wagram"
user.skill_list = "Ruby, JS, React"
user.company = Company.first
user.avatar_url = "https://avatars2.githubusercontent.com/u/58515521?v=4"
user.credits = 40
user.save!

user = User.new
user.first_name = "Alexandre"
user.last_name = "Platteeuw"
user.email = "alex@lewagon.org"
user.password = "alexandre"
user.description = "Génie du Java script"
user.job = "Dev Fullstack"
user.admin = false
user.address = "2 rue de la bastille"
user.skill_list = "Ruby, JS, React"
user.company = Company.first
user.avatar_url = "https://avatars0.githubusercontent.com/u/57015378?v=4"
user.credits = 40
user.save!

puts 'Users created!'

puts 'Creating a reservation...'

reservation = Reservation.new
reservation.user = user
reservation.project = project
reservation.save!

puts 'Reservation created!'


