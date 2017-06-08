class Cocktail < ApplicationRecord
  has_many :doses, :dependent => :destroy
  has_many :ingredients, through: :doses
  # so doses is the intermediate between cocktails and ingredients
  validates :name, uniqueness: true, presence: true
  #to have a name unique
end
