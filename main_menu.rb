require './lib/to_do.rb'

@lists = {}

def help
  puts "\n\n"
  puts "enter 'l' to add a list"
  puts "enter 'show' to show all the lists in the To Do List"
  puts "enter list name to modify list"
  puts "type ? for a list of options"
  puts "\n\n"
end

def add_list
  puts "Enter the name of your list"
  list_name = gets.chomp
  @lists[list_name] = List.new(list_name)
end

def show_list
  print "|"
  @lists.each { |key, list| print "|  #{list.title}  |" }
  print "|\n"
  puts "\n"

  puts "Enter l to add a list or a list name to add tasks to that list"
end

def add_task(list_name)
  print "Enter a task for #{list_name}: "
  new_task = gets.chomp
  @lists[list_name].add_task(new_task)
end

def show_tasks(list_name)
  puts "#{list_name}:"
  print "|"
  @lists[list_name].tasks.each { |key, task| print "|  #{task.description}#{ if task.done? then ": done" else "      " end}|"}
  print "|"
  puts "\n"
end

def mark_task(list_name)
  show_tasks(list_name)
  print "Enter a task to check off: "
  task_done = gets.chomp
  @lists[list_name].tasks[task_done].done
end

def delete_tasks(list_name)
  @lists[list_name].delete_done
  show_tasks(list_name)
end

def task_help
  puts "\n\n"
  puts "Enter 'a' to add a task,"
  puts "Enter 'check' to mark a task as finished"
  puts "Enter 'delete' to clear tasks that are finished"
  puts "Enter 'show' to show all tasks in list"
  puts "Enter '..' to return to lists"
  puts "\n\n"
end

system 'clear'
puts " ------------------------"
puts "| Welcome to To Do List! |"
puts " ----------------------- "

help
loop do
  print "> "
  input = gets.chomp

  case input
  when "?"
    help
  when "l"
    add_list
  when 'show'
    show_list
  when if @lists.key?(input) then @lists[input].title end
    list_name = input
    task_help

    loop do
      print "#{list_name} > "
      task_options = gets.chomp

      case task_options
      when "a"
        add_task(list_name)
      when 'check'
        mark_task(list_name)
      when 'delete'
        delete_tasks(list_name)
      when 'show'
        show_tasks(list_name)
      when '..'
        break
      end
    end
  else
    puts "wat"
  end
end
