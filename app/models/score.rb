class Score < ActiveRecord::Base
    after_update :score_check

    def self.import(file, event)
        CSV.foreach(file.path, headers: true, encoding: 'utf-8') do |row|
            score = row.to_hash
            score[:event_id] = event
            Score.create score
        end
    end

    # From the about page:
    #
    # * "1 point will be awarded for 1st place, 2 points for second,
    #   etc. down to 50 points."
    # * "Anglers finishing 50th place and below will receive 50 points."
    def points
        return self.position unless self.position > 50
        return 50
    end

    def team_check
        unless self.angler_id.blank? || self.co_angler_id.blank?
            # Get correct team
            team = Team.all.select { |team| team.users.count == 2 && team.users.first.id == self.angler_id && team.users.last.id == self.co_angler_id}.concat(Team.all.select{|team| team.users.count == 2 &&
            team.users.first.id == self.co_angler_id && team.users.last.id == self.angler_id}).uniq.first
            self.update_column("team_id", team.id.to_i) unless team.nil?
        end
    end

    def event_check
        unless self.team_id.blank?
            self.team.events << self.event unless self.team.events.include?(self.event)
        end
    end

    def score_check
        team_check
        event_check
    end

    validates :position, :event_id, :presence => true

    belongs_to :team
    belongs_to :event
    belongs_to :user
    belongs_to :angler_user, foreign_key: "angler_id", :class_name => "User"
    belongs_to :co_angler_user, foreign_key: "co_angler_id", :class_name => "User"


end
