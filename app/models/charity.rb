class Charity < ApplicationRecord
  has_many :projects, dependent: :destroy

  validates :name, presence: true
end
