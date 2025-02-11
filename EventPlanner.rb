# EventPlanner: A simple event management system

require 'date'

class EventPlanner
  attr_accessor :participants, :tasks, :event_date

  def initialize
    @participants = {} # Stores availability { "Alice" => ["2025-03-01", "2025-03-02"], ... }
    @tasks = {} # Stores tasks { "Decorations" => "Alice", "Food" => "Bob", ... }
    @event_date = nil
  end

  # Step 1: Collect participant availability
  def add_availability(name, available_dates)
    @participants[name] = available_dates
  end

  # Step 1: Find the best event date based on availability
  def find_best_date
    date_count = Hash.new(0)
    
    @participants.each_value do |dates|
      dates.each { |date| date_count[date] += 1 }
    end
    
    @event_date = date_count.max_by { |_, count| count }&.first
  end

  # Step 2: Assign tasks to participants
  def assign_tasks(task_list)
    participants_names = @participants.keys
    return if participants_names.empty?

    task_list.each_with_index do |task, index|
      assigned_person = participants_names[index % participants_names.size]
      @tasks[task] = assigned_person
    end
  end

  # Step 3: Send reminders (simulation)
  def send_reminders
    return unless @event_date

    today = Date.today
    event_day = Date.parse(@event_date)

    days_left = (event_day - today).to_i

    if days_left > 0
      puts "Reminder: The event is in #{days_left} days!"
      @tasks.each { |task, person| puts "Reminder: #{person}, you are responsible for '#{task}'." }
    elsif days_left == 0
      puts "Today is the event day! Have fun!"
    else
      puts "The event has already passed."
    end
  end
end

# Example Usage
planner = EventPlanner.new

# Step 1: Add availability
planner.add_availability("Alice", ["2025-03-01", "2025-03-02"])
planner.add_availability("Bob", ["2025-03-02", "2025-03-03"])
planner.add_availability("Charlie", ["2025-03-01", "2025-03-02", "2025-03-03"])

# Step 1: Find best date
planner.find_best_date
puts "Best date for the event: #{planner.event_date}"

# Step 2: Assign tasks
planner.assign_tasks(["Decorations", "Food", "Music"])
puts "Task Assignments: #{planner.tasks}"

# Step 3: Send reminders (assuming today is 2025-02-28)
planner.send_reminders
