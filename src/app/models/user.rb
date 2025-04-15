class User < ApplicationRecord
	# Associations from Devise 
	devise :database_authenticatable, :registerable,
		   :recoverable, :rememberable, :validatable,
		   :omniauthable, omniauth_providers: [:google_oauth2]
  
	# Relationship with entries
	has_many :weight_entries, dependent: :destroy
	has_many :step_entries, dependent: :destroy
  
	# Méthode pour traiter l'authentification OmniAuth
	def self.from_omniauth(auth)
	  # Recherche l'utilisateur par provider et uid ou crée un nouvel utilisateur
	  user = where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
		user.email = auth.info.email
		user.password = Devise.friendly_token[0, 20] # Mot de passe aléatoire
		user.name = auth.info.name
		user.image = auth.info.image
	  end
  
	  # Assurez-vous que l'utilisateur est sauvegardé
	  if user.new_record?
		user.save
		Rails.logger.info "Nouvel utilisateur créé via OAuth: #{user.email}"
	  else 
		Rails.logger.info "Utilisateur existant trouvé via OAuth: #{user.email}"
	  end
  
	  user
	end
  end