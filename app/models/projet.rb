class Projet < ActiveRecord::Base
	has_many :environnements
	validates_presence_of :name
	validates_presence_of :description
end
