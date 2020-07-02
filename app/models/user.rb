class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  acts_as_taggable_on :skills
  validates :first_name, :last_name, :address, presence: true
  validates :admin, :inclusion => { in: [true, false] }

  acts_as_favoritor
end
