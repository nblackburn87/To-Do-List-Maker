require 'rspec'
require 'to_do'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('scrub the zebra', 5, 03/15)
    test_task.should be_an_instance_of Task
  end

  it 'lets you read the description out' do
    test_task = Task.new('scrub the zebra', 5, 03/15)
    test_task.description.should eq 'scrub the zebra'
  end

  it 'creates tasks with their own priority rankings' do
    test_task = Task.new('scrub the zebra', 5, 03/15)
    test_task.priority.should eq 5
  end
end

describe List do
  it 'is initialized with a list name' do
    test_list = List.new('Chores')
    test_list.should be_an_instance_of List
  end

  it 'creates task objects with a list property' do
    test_list = List.new('Chores')
    task_to_add = Task.new('Scrub the Zebra', 5, 03/15)
    test_list.add_task(task_to_add)
    test_list.tasks.should eq [task_to_add]
  end
end
