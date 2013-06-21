class Team < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :events

    picture_options = {
        styles: {
            medium: '300x300>}',
            tourpro: '370x220#',
            teampro: '370x233#'
        },
        :url => "/system/:attachment/:id/:style.:extension",
    }
    picture_options.update({
        storage: :s3,
        s3_credentials: "#{::Rails.root}/config/aws.yml"
    }) if ENABLE_S3

  has_attached_file :team_picture, picture_options

end