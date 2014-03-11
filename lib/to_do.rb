class Task
  attr_reader :description, :priority

  def initialize(description)
    @description = description
    @done = false
    @priority = 0
  end

  def done?
    @done
  end

  def done
    @done = true
  end

  def change_priority(number)
    @priority = number
  end

end

class List
  attr_reader :tasks, :title

  def initialize(title)
    @tasks = {}
    @title = title
  end

  def add_task(description)
    @tasks[description] = Task.new(description)
  end

  def delete(task_name)
    @tasks.delete(task_name)
  end

  def delete_done
    @tasks.delete_if{|x| tasks[x].done? == true}
  end

end
