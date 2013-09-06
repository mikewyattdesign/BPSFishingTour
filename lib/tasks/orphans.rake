namespace :orphans do
  desc "Connects existing teams to their scores through team_id"
  task connect_team_to_score: :environment do
        # Get applicable teams
        teams = Team.all.reject { |team| team.users.count < 2 }

        teams.each do | team |
            angler = team.users.first
            co_angler = team.users.first.teammate

            Score.where(angler_id: angler.id, co_angler_id: co_angler.id)
            .concat(Score.where(angler_id: co_angler.id, co_angler_id: angler.id))
            .uniq.each {|score| score.update(team_id: team.id)}
        end
    end

    desc "Connects teams with a score for event to the event"
    task connect_team_to_event: :environment do
        # Get applicable scores
        team_scores = Score.where.not(team_id: nil)

        team_scores.each do |score|
            # Check for orphanage
            score.team.events << score.event unless score.team.events.nil? || score.team.events.include?(score.event)
        end
    end

    task :rescue => [:connect_team_to_score, :connect_team_to_event]

end
