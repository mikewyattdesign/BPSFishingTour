class Team < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :events

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

    def scores
        angler = self.users.first
        co_angler = self.users.last

        Score.where(angler_id: angler.id, co_angler_id: co_angler.id)
             .concat(Score.where(angler_id: co_angler.id, co_angler_id: angler.id))
             .uniq
    end

    def total_score
        scores.map { |score| score.points }.take(5).inject { |sum, x| sum + x }
    end
end
