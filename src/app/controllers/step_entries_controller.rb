class StepEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_step_entry, only: [:show, :edit, :update, :destroy]

  def index
    # Affiche uniquement les enregistrements de pas de l'utilisateur connecté
    @step_entries = current_user.step_entries.order(date: :desc)
  end

  def new
    # On initialise une nouvelle entrée associée à l'utilisateur
    @step_entry = StepEntry.new
  end


  def create
    @step_entry = current_user.step_entries.new(step_entry_params)
    if @step_entry.save
      redirect_to step_entries_path, notice: "Compteur de pas ajouté avec succès."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @step_entry.update(step_entry_params)
      redirect_to step_entries_path, notice: "Compteur de pas mis à jour."
    else
      render :edit
    end
  end

  def destroy
    @step_entry.destroy
    redirect_to step_entries_path, notice: "Compteur de pas supprimé."
  end

  private

  # Contraintes de sécurité : récupérer uniquement l'enregistrement de l'utilisateur connecté
  def set_step_entry
    @step_entry = current_user.step_entries.find(params[:id])
  end

  def step_entry_params
    params.require(:step_entry).permit(:steps, :date)
  end
end
