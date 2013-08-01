namespace :orphans do
  desc "TODO"
  task connect_team_to_score: :environment do
        # Get applicable scores for anglers
        angler_scores = Score.where(team_id: nil).where.not(angler_id: nil)
        angler_scores.each do |score|
            # Assign Correct Team to Score
            score.update(team_id: score.angler_user.teams.first.id) unless score.angler_user.teams.nil?
        end
        # Get applicable scores for co-anglers
        co_angler_scores = Score.where(team_id: nil).where.not(co_angler_id: nil)
        co_angler_scores.each do |score|
            # Assign Correct Team to Score
            score.update(team_id: score.co_angler_user.teams.first.id) unless score.co_angler_user.teams.nil?
        end
    end

    desc "TODO"
    task connect_team_to_event: :environment do
        # Get applicable scores
        team_scores = Score.where.not(team_id: nil)

        team_scores.each do |score|
            # Check for orphanage
            score.team.events << score.event unless score.team.events.nil? || score.team.events.include?(score.event)
        end
    end

end
