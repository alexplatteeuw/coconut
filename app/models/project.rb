class Project < ApplicationRecord
  belongs_to :charity
  has_many :reservations
  acts_as_taggable_on :tags, :skills

  validates :name, :address, :description, presence: true
  validates :status, inclusion: { in: ['unstarted', 'current', 'completed'] }, presence: true

  acts_as_favoritable
end
