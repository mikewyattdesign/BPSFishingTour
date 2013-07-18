class Score < ActiveRecord::Base
    def self.import(file, event)
        CSV.foreach(file.path, headers: true, encoding: 'utf-8') do |row|
            score = row.to_hash
            score[:event_id] = event
            Score.create! score
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
end
