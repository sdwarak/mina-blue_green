set_default :blue, 'CHANGE THIS'
set_default :green, 'CHANGE THIS'

_color = ARGV.first

%w(blue green).each do |color|
  desc "Set the target environment to '#{color}'."
  task(color) do
    val = settings.send(color.to_sym)
    if _color == color and val != 'CHANGE THIS'
      set :stage, 'production'
      set :domain, val
    end
  end
end

namespace :blue_green do
  desc 'Blue Green status'
  task :status do
    isolate do
      queue %{
        #{echo_cmd %[SHA=$(git --git-dir=#{deploy_to}/scm describe --always HEAD)]}
        #{echo_cmd %[ENV=$(pgrep -af unicorn | sed -n 1p | sed 's/.*-E //' | awk '{print $1}')]}
        echo "-----> Revision $SHA running in $ENV."
      }

      set :domain, blue
      print_str "-----> Blue"
      run!

      set :domain, green
      print_str "-----> Green"
      run!
    end
  end
end

desc 'Blue Green status'
task :blue_green => 'blue_green:status'
