class Event < ApplicationRecord
	validates :name, presence: true
	validates :startdate, presence: true
	validates :enddate, presence: true	
	validates :memo, length: { maximum: 30 }
end
