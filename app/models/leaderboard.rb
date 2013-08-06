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
        teams = Team.all.reject { |team| team.users.empty? || team.scores.empty? }

        teams.map { |team|
            {
                events_attended: team.scores.count,
                team: team,
                scores: team.scores,
                total_score: team.total_score,
            }
        }.sort!{ |x, y| x[:total_score] <=> y[:total_score] }
    end


    def self.aggregate_team_points(team)
        angler = team.users[0]
        co_angler = team.users[1]

        scores = team.scores
        scores.map { |score| score.points }.take(5).inject { |sum, x| sum + x }
    end

    def self.qualified_teams
        teams = Team.all.reject { |team| team.users.empty? || team.scores.empty? || team.scores.count < 5 }

        teams.map { |team|
            {
                events_attended: team.scores.count,
                team: team,
                scores: team.scores,
                total_score: team.total_score,
            }
        }.sort!{ |x, y| x[:total_score] <=> y[:total_score] }
    end

end
