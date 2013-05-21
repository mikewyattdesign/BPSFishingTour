namespace :logs do
    # Why use a lambda?  I felt like it.
    run = lambda { |command| puts Bundler.with_clean_env { `#{command}` } }

    desc "Display development logs"
    task :development do
        run.('heroku logs --app fishing-tour-dev')
    end

    desc "Display production logs"
    task :production do
        run.('heroku logs --app fishing-tour')
    end
end