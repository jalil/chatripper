class Event < ActiveRecord::Base
  validates :actor, presence: true
  validates :occurred_at, presence: true
  validates :action, presence: true
  
   def self.search_by_hour(time_one,time_two)
     where('time(occurred_at) BETWEEN ? AND ?', time_one, time_two)
  end

   def self.hourly_summary(time_one,time_two)
      summaries =  self.search_by_hour(time_one,time_two)
      actions_array = []
      counts = Hash.new(0)
      summaries.each { |summary| actions_array << summary.action }
      actions_array.each {|action| counts[action] +=1 }

      return counts

   end


   def self.retval_uniq_hours
     orig_val = 0
     occurred_at_array = []
      Event.all.each do |event| 
            if orig_val != event.occurred_at.strftime("%H")
                 orig_val = event.occurred_at.strftime("%H")
                 occurred_at_array << orig_val
            end 
      end
             return occurred_at_array
   end

end

