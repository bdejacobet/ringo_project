class Environnement < ActiveRecord::Base
	belongs_to :projet
	validates_presence_of :name
	validates_presence_of :description
end
