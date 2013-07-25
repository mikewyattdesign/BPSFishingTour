class Leaderboard
    def self.boards
        boards = teams.group_by { |team|
            (team[:events_attended] > 5) ? 5 : team[:events_attended]
        }
        boards.delete(0)
        # boards.each do |board|
        #     next unless board.present?
        #     board.sort! { |x, y| x[:total_score] <=> y[:total_score] }
        # end
        boards
    end

    def self.teams
        teams = Team.all.reject { |team| team.users.empty? }

        teams.map { |team|
            {
                events_attended: team.scores.count,
                team: team,
                scores: team.scores,
                total_score: team.total_score,
            }
        }
    end


    def self.aggregate_team_points(team)
        angler = team.users.first
        co_angler = team.users.last

        scores = Score.where(angler_id: angler.id, co_angler_id: co_angler.id).concat(Score.where(angler_id: co_angler.id, co_angler_id: angler.id)).uniq

        scores.map { |score| score.points }.take(5).inject { |sum, x| sum + x }
    end
end
