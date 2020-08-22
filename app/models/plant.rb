class Plant < ApplicationRecord
  belongs_to :user
  has_many :growth_record
end
