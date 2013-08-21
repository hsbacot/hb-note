class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  ROLES = %w[admin moderator]

  has_many :notebooks
  has_many :notes, through: :notebooks
  
  accepts_nested_attributes_for :notebooks, :notes

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :username, length: { minimum: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
