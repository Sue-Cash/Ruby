class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Méthode appelée lorsque l'authentification Google réussit
  def google_oauth2
    # Utilise la méthode du modèle User pour trouver/créer un utilisateur
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # Log pour débogage
      Rails.logger.info "Utilisateur authentifié avec succès via Google: #{@user.email}"
      
      # Connexion et redirection
      sign_in @user
      redirect_to weight_entries_path, notice: "Connexion réussie via Google."
    else
      # En cas d'échec, stocke les données et redirige vers inscription
      Rails.logger.error "Échec de l'authentification Google: #{@user.errors.full_messages.join(', ')}"
      session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url, alert: "Impossible de vous connecter via Google. Veuillez créer un compte."
    end
  end

  # Méthode appelée en cas d'échec
  def failure
    Rails.logger.error "Échec de l'authentification OmniAuth: #{failure_message}"
    redirect_to root_path, alert: "Échec de l'authentification: #{failure_message}"
  end
end