require 'active_support/core_ext'

guard 'rspec', all_after_pass: false do
    watch(%r{^app/controllers/(.+)_(controller)\.rb$})  do |m|
        [
            "spec/routing/#{m[1]}_routing_spec.rb",
            "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
            "spec/acceptance/#{m[1]}_spec.rb",
            (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb"
                            : "spec/requests/#{m[1].singularize}_pages_spec.rb")
        ]
    end

    watch(%r{^app/views/(.+)/}) do |m|
        (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb"
                        : "spec/requests/#{m[1].singularize}_pages_spec.rb")
    end

    watch(%r{^app/controllers/sessions_controller\.rb$}) do |m|
        "spec/requests/authentication_pages_spec.rb"
    end

    watch('config/routes.rb') do
        'spec/routing/'
    end

    watch(%r{^spec/(.+)/(.+)\.rb$}) do |match|
        "spec/#{match[1]}/#{match[2]}.rb"
    end
end

