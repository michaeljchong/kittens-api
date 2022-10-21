class Kitten < ApplicationRecord
  validates :name, :age, :cuteness, :softness, presence: true

  CUTENESS = [ "Mehh", "A little", "Cute!", "OMG!!!"]
  SOFTNESS = [ "So rough", "Could use a brushing", "Fluffy!"]
end
