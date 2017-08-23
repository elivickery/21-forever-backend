namespace :next do
  desc "Rake task to generate new days"

  task :day => :environment do

    # Loop thru all the goals
    Goal.where(completed: false).each do |goal|

      #Set all days where date = yesterday and status = nil to status = false
      if goal.days.where(status: 'failed').length > 0 || goal.days.where(status: nil).length > 0
        goal.days.destroy_all
      end

      new_day = goal.days.new
      if new_day.save
        puts "New day generated successfully for: " + goal.user.email
      else
        puts "! Could not generate new day for: " + goal.user.email
        puts new_day.errors.full_messages
      end

    end

  end

end
