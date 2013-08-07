class Event < ActiveRecord::Base
    has_and_belongs_to_many :divisions
    has_and_belongs_to_many :teams
    has_many :scores


    validates :name, :date, :presence => true

    default_scope {
        order('date ASC')
    }

    def name_and_date
        "#{self.name} #{self.date}"
    end
end
