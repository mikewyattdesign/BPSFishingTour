class Profile < ActiveRecord::Base
    belongs_to :user
    validates :first_name, :last_name, :city, :street_address, :state, :presence => true, :on => :update
    picture_options = {
        styles: {
            medium: '300x300>}',
            teamP: '96x96#',
            tour: '80x80#'
        }
    }
    picture_options.update({
        storage: :s3,
        s3_credentials: "#{::Rails.root}/config/aws.yml"
    }) if ENABLE_S3

  has_attached_file :picture, picture_options

    def self.directory
        names = Profile.all.sort{|x,y|
            x.last_name.to_s.strip.capitalize <=> y.last_name.to_s.strip.capitalize }
            .map { |profile|
            {
                name: "#{profile.last_name.to_s.strip.capitalize}, #{profile.first_name.to_s.strip.capitalize}",
                id: profile.id,
            }
        }
        names.select { |name| name[:name] !~ /^,/ }.group_by {|name| name[:name][0] }
    end

    def shirt_size
        case self.shirt
        when "1"
            "1"
        when "2"
            "XS"
        when "3"
            "S"
        when "4"
            "M"
        when "5"
            "L"
        when "6"
            "XL"
        when "7"
            "XXL"
        when "8"
            "XXXL"
        end
    end

end
