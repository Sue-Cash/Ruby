class User < ApplicationRecord
	# Associations from Devise 
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable # Relationship with weight entries has_many :weight_entries, dependent: :destroy

	has_many :weight_entries, dependent: :destroy

	has_many :step_entries, dependent: :destroy
end