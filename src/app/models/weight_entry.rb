class WeightEntry < ApplicationRecord
  belongs_to :user  # Cela signifie que chaque WeightEntry doit avoir un user_id

  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
end
