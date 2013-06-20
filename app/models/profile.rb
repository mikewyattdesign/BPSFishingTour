class Profile < ActiveRecord::Base
    belongs_to :user

    validates :first_name, :last_name, :city, :street_address, :state, :presence => true, :on => :update

    def self.directory
        names = Profile.all.map { |profile|
            {
                name: "#{profile.last_name}, #{profile.first_name}",
                id: profile.id,
            }
        }
        names.select { |name| name[:name] !~ /^,/ }.group_by {|name| name[:name][0].upcase }
    end
end
