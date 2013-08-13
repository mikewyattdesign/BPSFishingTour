namespace :profile do
  desc "TODO"
  task fix_names: :environment do
    Profile.all.each{|profile|
        profile.update_attributes(last_name: profile.last_name.strip) unless profile.last_name.nil?
        profile.update_attributes(first_name: profile.first_name.strip) unless profile.first_name.nil?
    }
  end

end
