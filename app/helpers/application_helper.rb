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
        if user && user.profile.picture?
             return image_tag user.profile.picture.url(area), class: the_class, alt: alt
         else
            return image_tag 'iconPersonSmall.png', class: the_class, alt: alt
        end
    end
end
