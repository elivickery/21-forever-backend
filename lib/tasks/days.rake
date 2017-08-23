namespace :next do
  desc "Rake task to generate new days"

  task :day => :environment do

    # Loop thru all the goals
    Goal.where(completed: false).each do |goal|

      #Set all days where date = yesterday and status = nil to status = false
      yesterday_nil = goal.days.where("DATE(created_at) = ?", Date.today-1).where(:status => nil)

      if yesterday_nil
        yesterday_nil.update(status: 'failed')
      end

      failed_days = goal.days.where(:status => 'failed')

      if failed_days
        goal.days.destroy_all
      end

      new_day = goal.days.new
      if new_day.save
        puts "New day generated successfully for: " + goal.title
      else
        puts "! Could not generate new day for: " + goal.title
        puts new_day.errors.full_messages
      end

    end

  end

end
