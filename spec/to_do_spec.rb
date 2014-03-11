require "rspec"
require "./lib/to_do.rb"

describe 'to_do' do
  describe 'Task' do
    it 'creates a task from a description' do
      new_task = Task.new('exist')
      new_task.should be_an_instance_of Task
    end

    it 'is marked as not done when it is created' do
      new_task = Task.new('face the absurd')
      new_task.done?.should eq false
    end

    it 'is marked as done when done is called' do
      new_task = Task.new('face the absurd')
      new_task.done
      new_task.done?.should eq true
    end

    it 'gives a task a priority' do
      new_task = Task.new('Get Gas')
      new_task.change_priority(5)
      new_task.priority.should eq 5
    end

  end

  describe 'List' do

    it 'creates a list from a title' do
      new_list = List.new('Existentialism')
      new_list.should be_an_instance_of List
    end

    it 'creates a task within the list' do
      new_list = List.new('Existence')
      new_list.add_task("give purpose")
      new_list.tasks['give purpose'].should be_an_instance_of Task
    end

    it 'is able to return all created tasks in a list' do
      new_list = List.new('Existentialism')
      new_list.add_task('Camus')
      new_list.add_task('Sartre')
      new_list.add_task('Beckett')
      new_list.tasks.length.should eq(3)
    end

    it 'should be able to mark a task as done, from the list' do
      new_list = List.new('Existentialism')
      new_list.add_task('Camus')
      new_list.add_task('Wiggtenstein')

      new_list.tasks['Camus'].done
      new_list.tasks['Camus'].done?.should eq true
    end

    it 'should be able to delete task if it is done' do
      new_list = List.new('ListA')
      new_list.add_task('Task1')
      new_list.add_task('Task2')
      new_list.add_task('Task3')
      new_list.tasks["Task3"].done
      new_list.delete_done
      new_list.tasks.length.should eq 2
    end

    it 'should be able to delete any task when asked' do
      new_list = List.new('ListA')
      new_list.add_task('Task1')
      new_list.add_task('Task2')
      new_list.add_task('Task3')
      new_list.delete('Task2')
      new_list.tasks.length.should eq 2
    end
  end
end


describe "to"  do
  it "does" do
    this = 'done'
    this.should eq 'done'
  end
end
