module EventsHelper
    def add_status(event)
        if event.date.past?
            return "Processing"
        else
            return "Comming Soon"
        end
    end
end
