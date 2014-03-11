require './lib/to_do'
require 'date'

@list = []

def main_menu
  puts "Press 'n' to create a new ToDo List."
  puts "Press 'a' to add a task or 'l' to list all of your tasks."
  puts "Press 'r' to remove a task from your list."
  puts "Press 'd' to sort your tasks by the due date."
  puts "Press 'p' to sort your tasks by priority."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  if main_choice == 'n'
    add_list
  elsif main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'd'
    sort_by_date
  elsif main_choice == 'p'
    sort_by_priority
  elsif main_choice == 'r'
    remove_task
  elsif main_choice == 'x'
    puts "Good-Bye!"
  else
    puts "Sorry, that wasn't a valid option."
    main_menu
  end
end

def add_list
  puts "What would you like to call your list: "
  list_description = gets.chomp
  @list << List.new(list_description)
  puts "List created.\n"
  main_menu
end

def add_task
  puts "Enter a description of the new task: "
  task_description = gets.chomp
  puts "What priority is this task (1-5): "
  task_priority = gets.chomp
  puts "When must this task be accomplished? (mm/dd)"
  task_date = gets.chomp
  puts "On what list would you like that task filed?: "
  list_description = gets.chomp
  task_to_add = (Task.new(task_description, task_priority, task_date))
  @list.each do |list|
    if list.description == list_description
      list.add_task(task_to_add)
    end
  end
  puts "Task added.\n\n"
  main_menu
end

def sort_by_date
  @list.each do |list|
    list.sort_by_date
  end
  main_menu
end

def sort_by_priority
  @list.each do |list|
    list.sort_by_priority
  end
  main_menu
end

def list_tasks
  puts "Here are all of your lists: "
  @list.each do |list|
    puts list.description
    puts "----"
    list.tasks.each do |task|
      puts task.description + " " + task.due_date.to_s
    end
    puts "\n"
  end
  puts "\n"
  main_menu
end

def remove_task
  puts "Which task would you like to remove?: "
  removal_task = gets.chomp
  @list.each do |list|
    list.tasks.delete_if do |task|
      task.description == removal_task
    end
  end
  puts "Task deleted.\n"
  main_menu
end

main_menu
