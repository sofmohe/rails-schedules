class User < ApplicationRecord
	validates :name, presence: true
	validates :nickname, presence: true, uniqueness: true
	validates :memo, length: { maximum: 50 }
	validates :password, presence: true
	validates :email, presence: true	
end
