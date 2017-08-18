namespace :next do
  desc "Rake task to generate new days"

  task :day => :environment do

    # Loop thru all the goals
    Goal.all.each do |goal|

      #Set all days where date = yesterday and status = nil to status = false
      Day.where(:goal_id => goal.id).where("DATE(created_at) = ?", Date.today-1).where(:status => nil).update(:status => false)

      # Create a new day for this goal
      new_day = Day.new(goal_id: goal.id)
      if new_day.save
        puts "New day generated successfully for: " + goal.title
      else
        puts "! Could not generate new day for: " + goal.title
        puts new_day.errors.full_messages
      end
    end

  end

end
