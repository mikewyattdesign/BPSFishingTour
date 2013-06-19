class Profile < ActiveRecord::Base
    belongs_to :user

    validates :first_name, :last_name, :city, :street_address, :state, :presence => true, :on => :update

    def self.directory
        names = Profile.all.map { |profile| "#{profile.last_name}, #{profile.first_name}" }
        names.select { |name| name !~ /^,/ }.group_by {|name| name[0].upcase }
    end
end
