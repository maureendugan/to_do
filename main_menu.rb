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

def list(method, list_name)
  case method
  when "add"
    add_list(list_name)
  when "show"
    show_list
  when "del"
    del_list(list_name)
  end
end

def del_list(list_name)
  @lists.delete(list_name)
end

def add_list(list_name)
  @lists[list_name] = List.new(list_name)
end

def show_list
  puts ""
  @lists.each do |key, list|
    puts ">>  #{list.title}"
    show_tasks(list.title)
  end
  puts ""
end

def add_task(list_name)
  print "Enter a task for #{list_name}: "
  new_task = gets.chomp
  @lists[list_name].add_task(new_task)
end

def show_tasks(list_name)
  @lists[list_name].tasks.each { |key, task| puts ">>>>   #{task.description}#{ if task.done? then "(done)" end}"}
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
  input = gets.chomp.split

  case input[0]
  when "?"
    help
  when "l"
    list(input[1], input[2])
  when 'show'
    show_list
  when if @lists.key?(input[0]) then @lists[input[0]].title end
    list_name = input[0]
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
