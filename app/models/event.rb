class Event < ActiveRecord::Base
    has_and_belongs_to_many :divisions
    has_and_belongs_to_many :teams
end
