module EventsHelper
    def add_status(team, event)
        score = team.event_score(event)
        return "#{pluralize(score, "point")}" if score
        return "Processing" if event.date.past?
        return "Coming Soon"
    end
end
