class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :tasks, inverse_of: :user
end
