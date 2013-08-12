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
            name = self.downcase.split("-").map{|section| section.capitalize}.join("-")
            case
            when name.match(/^Mac/).present?
                "Mac" + name.split("Mac").last.slice(0,1).capitalize + name.split("Mac").last.slice(1..-1)
            when name.match(/^Mc/).present?
                "Mc" + name.split("Mc").last.slice(0,1).capitalize + name.split("Mc").last.slice(1..-1)
            when name.match(/^O\'/).present?
                "O\'" + name.split("O\'").last.slice(0,1).capitalize + name.split("O\'").last.slice(1..-1)
            else
                name
            end
        end
    end

    def render_notification
        return false unless current_user.present?

        if current_user.profile.first_name.blank? || current_user.profile.last_name.blank?
            return render template: 'notifications/add_name_to_profile'
        end

        if current_user.teams.empty?
            if Request.where(requester: current_user.id).empty?
                return render template: 'notifications/request_a_teammate'
            else
                return render template: 'notifications/remind_your_teammate_to_accept'
            end
        end
    end
end
