class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  acts_as_taggable_on :skills
  has_many :reservations
  has_many :projects, -> { distinct }, through: :reservations


  validates :first_name, :last_name, :address, presence: true
  validates :admin, :inclusion => { in: [true, false] }

  # def unavailable_dates
  #   reservations.pluck(:start_date, :end_date).map do |range|
  #     { from: range[0], to: range[1] }
  #   end
  # end

  def self.with_reservations
    User.joins(:reservations).group("users.id")
  end

end
