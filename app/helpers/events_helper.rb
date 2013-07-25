module EventsHelper
    def add_status(team, event)
        score = team.event_score(event)
        return "#{score} points" if score
        return "Processing" if event.date.past?
        return "Coming Soon"
    end
end
