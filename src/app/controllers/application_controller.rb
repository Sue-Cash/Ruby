class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	# Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
	allow_browser versions: :modern
	
	# Définit clairement où rediriger après connexion réussie
	def after_sign_in_path_for(resource)
	  # Log pour débogage
	  Rails.logger.info "Redirection après connexion vers weight_entries_path"
	  weight_entries_path # Redirection vers la page principale après connexion
	end
	
	# Définit où rediriger après déconnexion
	def after_sign_out_path_for(resource_or_scope)
	  new_user_session_path # Redirection vers la page de connexion après déconnexion
	end
  end