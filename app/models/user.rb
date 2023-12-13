class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
        :jwt_authenticatable,
        :registerable,
        jwt_revocation_strategy: JwtDenylist

  attr_accessor :first_name, :last_name
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  has_many :transactions, foreign_key: :user_id
end
