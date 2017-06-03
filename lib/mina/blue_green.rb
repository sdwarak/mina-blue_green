# set_default :blue, 'CHANGE THIS'
# set_default :green, 'CHANGE THIS'


%w(blue green).each do |color|
  if ARGV.delete(color)
    _color = color
  end
  desc "Set the target environment to '#{color}'."
  task(color) do
    set :domain, fetch(color.to_sym)
  end
end

desc 'Blue Green status'
task :status do
  isolate do
    command %{
      current_sha=$(git --git-dir=#{deploy_to}/scm describe --always HEAD)
      current_branch=$(git --git-dir=#{deploy_to}/scm branch --contains $current_sha | sed -n 1p)
      current_rails_env=$(ps auxf | grep unicorn | sed -n 1p | sed 's/.*-E //' | awk '{print $1}')
      echo "-----> Revision $current_sha ($current_branch) running in $current_rails_env."
    }
    run!
  end
end

