class Environnement < ActiveRecord::Base
	belongs_to :projet
	has_many :branches
	validates_presence_of :name
	validates_presence_of :description
end
