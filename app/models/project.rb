class Project < ApplicationRecord
  belongs_to :charity
  acts_as_taggable_on :tags, :skills

  validates :name, :address, :description, presence: true


end
