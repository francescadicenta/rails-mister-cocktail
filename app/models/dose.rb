class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id]
    validates :description, uniqueness: true, presence: true
    validates :ingredient_id, presence: true
  # unique for a given cocktail/ingredient couple
end
