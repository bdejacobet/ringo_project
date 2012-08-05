class Branche < ActiveRecord::Base
	belongs_to :environnement
	validates_presence_of :name
	validates_presence_of :description
end
