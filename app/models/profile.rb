class Profile < ActiveRecord::Base
    belongs_to :user

    validates :first_name, :last_name, :city, :street_address, :state, :presence => true, :on => :update
end
