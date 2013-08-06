class Team < ActiveRecord::Base
    has_and_belongs_to_many :users, -> {uniq.limit(2)},
        before_add: [:unique_users, :room_to_grow]
    has_and_belongs_to_many :events
    has_many :scores

    picture_options = {
        styles: {
            medium: '300x300>}',
            tourpro: '370x220#',
            teampro: '370x233#'
        }
    }
    picture_options.update({
        storage: :s3,
        s3_credentials: "#{::Rails.root}/config/aws.yml"
    }) if ENABLE_S3

  has_attached_file :team_picture, picture_options

    # def scores
    #     angler = self.users.first
    #     co_angler = self.users.last

    #     Score.where(angler_id: angler.id, co_angler_id: co_angler.id)
    #          .concat(Score.where(angler_id: co_angler.id, co_angler_id: angler.id))
    #          .uniq
    # end

    def event_score(event)
        score = scores.select { |score| score.event_id ==  event.id }
        if score.present?
            return score.first.points
        end
        return nil
    end

    def total_score
        scores.sort{ |x, y| x.points <=> y.points }.map { |score| score.points }.take(5).inject { |sum, x| sum + x }
    end

    def name
        "#{self.users.first.profile.last_name.capitalize} / #{self.users.last.profile.last_name.capitalize}"
    end

    def room_to_grow(user)
        raise FullTeamError if self.users.count == 2
    end

    def unique_users(user)
       self.users.delete(user) if self.users.include?(user)
    end

    class FullTeamError < StandardError
    end

end
