set :environment, "development"
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 1.day, at: '9:57 pm' do
  rake 'destroy_events:task_1'
end