class Project < ApplicationRecord
  belongs_to :charity
  has_many :reservations
  has_many :users, -> { distinct }, through: :reservations

  validates :name, :address, :description, presence: true
  validates :status, inclusion: { in: ['unstarted', 'current', 'completed'] }, presence: true

  acts_as_taggable_on :tags, :skills
  acts_as_favoritable

  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description
  end
end
