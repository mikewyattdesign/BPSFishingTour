module ApplicationHelper
    def has_team?
        current_user.teams.exists?
    end

    def is_registered?
        if current_user.profile.valid?
            return true
        else
            current_user.profile.errors.clear
            return false
        end
    end

    def drop_profile_teammate_pic(user, the_class, area, alt)
        if user && user.profile.picture.exists?
             return image_tag user.profile.picture.url(area), class: the_class, alt: alt
         else
            return image_tag 'iconPersonSmall.png', class: the_class, alt: alt
        end
    end

    def team_picture(team, the_class, area, alt)
        if team && team.team_picture.exists?
            return image_tag team.team_picture.url(area), class: the_class, alt: alt
        end
    end

    String.class_eval do
        def nameize
            name = self.strip.downcase.split("-").map{|section| section.capitalize}.join("-")
        end
    end
end
