class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  acts_as_taggable_on :skills
  has_many :reservations
  has_many :projects, -> { distinct }, through: :reservations
  has_many :events

  validates :first_name, :last_name, :address, presence: true
  validates :admin, inclusion: { in: [true, false] }
end
