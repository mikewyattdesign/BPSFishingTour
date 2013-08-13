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

    # Used to merge the event passed in into the calling event
    def merge(event, destroy = true)
        begin
            #merge scores
            raise if !self.scores.empty? && !event.scores.empty?
            event.scores.each do |score|
                score.update(event_id: self.id)
            end
        rescue
            return false
        end

        #merge divisions if applicable
        event.divisions.each do |division|
            division.events << self unless division.events.include?(self)
        end

        #merge teams
        event.teams.each do |team|
            self.teams << team unless self.teams.include?(team)
        end

        Event.destroy(event.id) if destroy
    end

    def merge_into(event)
        event.merge(self)
    end
end
