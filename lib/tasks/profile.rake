namespace :profile do
  desc "TODO"
  task fix_names: :environment do
    fix_count = 0
    Profile.all.each{|profile|
        if (profile.last_name.present? && profile.last_name != profile.last_name.strip) || (profile.first_name.present? && profile.first_name != profile.first_name.strip)
            puts "Fixed "+profile.first_name.strip+" "+profile.last_name.strip
            fix_count += 1
        end
        profile.update_attributes(last_name: profile.last_name.strip) unless profile.last_name.nil?
        profile.update_attributes(first_name: profile.first_name.strip) unless profile.first_name.nil?
    }

    puts "Fixed #{fix_count} #{"name".pluralize(fix_count)}"
  end

end
