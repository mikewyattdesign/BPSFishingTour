namespace :shirt_size do
    desc "Changes all current shirt sizes (numbers) to the actual sizes"
    task :shirts => :environment do
        profiles = Profile.all

        profiles.each do |profile|
            next unless profile.first_name.present?
            shirt = profile.shirt
            puts "Shirt before: " + shirt
            case shirt
                when "1"
                    profile.shirt = "1"
                when "2"
                    profile.shirt = "XS"
                when "3"
                    profile.shirt = "S"
                when "4"
                    profile.shirt = "M"
                when "5"
                    profile.shirt = "L"
                when "6"
                    profile.shirt = "XL"
                when "7"
                    profile.shirt = "XXL"
                when "8"
                    profile.shirt = "XXXL"
            end
            puts "Shirt after: " + shirt
            profile.save!
        end
    end
end