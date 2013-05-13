namespace :deploy do
    desc "deploy to development site and run migrations"
    task :development do
        `git push git@heroku.com:fishing-tour-dev.git master`
        Bundler.with_clean_env { p `heroku run --app fishing-tour-dev rake db:migrate` }
    end

    desc "deploy to production site and run migrations"
    task :production do
        `git push git@heroku.com:fishing-tour.git master`
        Bundler.with_clean_env { p `heroku run --app fishing-tour rake db:migrate` }
    end
end