class Project < ApplicationRecord
  belongs_to :charity
  acts_as_taggable_on :tags, :skills

  validates :name, :address, :description, presence: true

  acts_as_favoritable

end
