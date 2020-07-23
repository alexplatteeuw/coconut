class Project < ApplicationRecord
  belongs_to :charity
  has_many :reservations
  has_many_attached :documents
  has_many :users, -> { distinct }, through: :reservations
  has_many :events, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  acts_as_taggable_on :tags, :skills
  acts_as_favoritable

  validates :name, :address, :description, presence: true
  validates :status, inclusion: { in: ['created', 'preselected', 'pending', 'completed'] }, presence: true
end
