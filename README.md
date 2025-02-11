
# Event Planner

A simple event planning system in Ruby that helps families organize events by finding the best date, assigning tasks, and sending reminders.

## Features

- **Date Suggestion**: Determines the best event date based on participant availability.
- **Task Organizer**: Assigns tasks to participants to ensure all preparations are covered.
- **Event Reminder**: Sends notifications to participants as the event date approaches.

## Installation

Ensure you have Ruby installed on your system. Then, clone the repository and navigate to the project directory:

``` sh
git clone https://github.com/DragonKzWy/EventPlanner.git
cd EventPlanner
```

## Usage

1. **Add Participant Availability**  
   Define the available dates for each participant using `add_availability`:

   ```ruby
   planner = EventPlanner.new
   planner.add_availability("Alice", ["2025-03-01", "2025-03-02"])
   planner.add_availability("Bob", ["2025-03-02", "2025-03-03"])
   ```

2. **Find the Best Event Date**  
   Call `find_best_date` to determine the most suitable date:

   ```ruby
   planner.find_best_date
   puts "Best date for the event: #{planner.event_date}"
   ```

3. **Assign Tasks**  
   Assign tasks among participants using `assign_tasks`:

   ```ruby
   planner.assign_tasks(["Decorations", "Food", "Music"])
   puts "Task Assignments: #{planner.tasks}"
   ```

4. **Send Reminders**  
   Simulate sending reminders based on the event date:

   ```ruby
   planner.send_reminders
   ```

## Example Output

```
Best date for the event: 2025-03-02
Task Assignments: {"Decorations"=>"Alice", "Food"=>"Bob", "Music"=>"Charlie"}
Reminder: The event is in X days!
Reminder: Alice, you are responsible for 'Decorations'.
Reminder: Bob, you are responsible for 'Food'.
Reminder: Charlie, you are responsible for 'Music'.
```

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve the project.

## License

This project is licensed under the MIT License.
```
