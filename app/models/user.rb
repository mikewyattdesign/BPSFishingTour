class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    has_and_belongs_to_many :teams
    has_one :profile, dependent: :destroy

    def full_name
        if self.profile.nil?
            return nil
        end
        "#{self.profile.first_name} #{self.profile.last_name}"
    end
    def hit_team_limit?
        max_teams = 1
        if self.teams.size < max_teams
            false
        else
            true
        end
    end
end
