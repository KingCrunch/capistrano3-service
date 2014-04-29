namespace :service do
  %w[start stop restart reload force-reload status].each do |command|
    desc "#{command} service"
    task command, :service, :role do |t, args|
      service = args[:service]
      role = args[:role] || :all

      on release_roles role do
        within release_path do
          execute :sudo, :service, "#{service}", "#{command}"
        end
      end

      Rake::Task[t.name].reenable
    end
  end
end

