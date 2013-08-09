class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    has_and_belongs_to_many :teams
    has_one :profile, dependent: :destroy
    after_create :create_user_profile
    has_many :scores, through: :teams
    has_many :events, through: :teams


    def full_name(arrangement = 'f l')
        if self.profile.first_name.nil? || self.profile.last_name.nil?
            return nil
        end
        if arrangement == 'f l'
            "#{self.profile.first_name.capitalize} #{self.profile.last_name.capitalize}"
        else
            "#{self.profile.last_name.to_s.strip.capitalize}, #{self.profile.first_name.to_s.strip.capitalize}"
        end
    end
    def hit_team_limit?
        max_teams = 1
        if self.teams.size < max_teams
            false
        else
            true
        end
    end
    # At the moment each user only has one team
    # later on users may have multiple teams.. this
    # method will change to access specific teams  and will likely
    # take parameters.
    def my_team
      self.teams.first
    end


    def create_user_profile
      self.create_profile
    end

    # Currently each user only has one teammate. This method will change
    # see above `my_team` method.
    def teammate
      my_team = self.teams.first
      if my_team
        team_members = my_team.users
        teammate = team_members.select { |member|  member.id != self.id  }
        return teammate.first
      else
        return false
      end
    end

    def total_score
        my_team.total_score
    end

    def self.no_profile
        User.select{|user| user.profile.nil? || user.profile.first_name.blank? || user.profile.last_name.blank?}
    end

    def self.no_team
        User.select{|user| user.teams.empty?}
    end

end
