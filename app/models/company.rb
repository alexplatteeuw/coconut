class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, :address, presence: true

  acts_as_favoritor
end
