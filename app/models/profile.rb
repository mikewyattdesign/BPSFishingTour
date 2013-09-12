class Profile < ActiveRecord::Base
    belongs_to :user
    validates :first_name, :last_name, :city, :street_address, :state, :presence => true, :on => :update
    validates_format_of :first_name, :last_name, :city, :street_address, :state, :zip, :allow_blank => true,
        without: /\A[ \t]+|[ \t]+\z/,
        on: :update,
        message: "- please remove trailing and/or leading whitespace"

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
  acts_as_deactivatable :auto_configure_dependencies => true


    def self.directory
        names = Profile.all.reject{|profile| profile.first_name.blank? || profile.last_name.blank?}.sort{|x,y|
            x.last_name.to_s.strip.capitalize <=> y.last_name.to_s.strip.capitalize }
            .map { |profile|
            {
                name: "#{profile.last_name.to_s.nameize}, #{profile.first_name.to_s.nameize}",
                id: profile.id,
            }
        }
        names.select { |name| name[:name] !~ /^,/ }.group_by {|name| name[:name][0] }
    end

    def shirt_size
        case self.shirt
        when "1"
            "-"
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

    def full_name(arrangement = 'f l')
        if self.first_name.nil? || self.last_name.nil?
            return nil
        end
        if arrangement == 'f l'
            "#{self.first_name.nameize} #{self.last_name.nameize}"
        else
            "#{self.last_name.to_s.nameize}, #{self.first_name.to_s.nameize}"
        end
    end

end
