namespace :destroy_events do
  desc "Destroy events that are passed 1 day ago"
  task task_1: :environment do
    all_events = Event.all
    all_events.each do |event|
      if event.date < 1.day.ago
        event.destroy
      end
    end
  end
end


