namespace :deploy do
    desc "deploy to development site and run migrations"
    task :development do
        env = 'development'
        push_rake env
    end

    desc "deploy to production site and run migrations"
    task :production do
        env = 'production'
        push_rake env
    end


    def push_rake (environment)
        env = environment
        remote = `git config --get remote.#{env}.url`
        if remote == ''
            puts "There is no #{env} remote present, would you like to add one?"
            add_remote = STDIN.gets.chomp
            if %w(yes y yup yea ya yessir).include? add_remote.downcase
                puts "ok cool, I will add the remote 'development' with the url 'git@heroku.com:fishing-tour#{ env == 'development' ? '-dev' : ''}.git master'"
                `git remote add #{env} git@heroku.com:fishing-tour#{ env == 'development' ? '-dev' : ''}.git`
            else
                puts 'ok, thats cool too. You just can\'t use this awesome rake task though.'
                return
            end
        end
        `git push #{environment} master`
        puts Bundler.with_clean_env { `heroku run --app fishing-tour#{ env == 'development' ? '-dev' : ''} rake db:migrate` }
    end
end