class Book < ApplicationRecord
  belongs_to :format
  has_many :authorships
  has_many :authors, through: :authorships
end
