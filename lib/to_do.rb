class Task
  def initialize(description)
    @description = description
  end

  def description
    @description
  end
end

class List

  def initialize(list_name)
    @tasks = []
    @list_name = list_name
    @description = list_name
  end

  def description
    @description
  end

  def add_task(task_to_add)
    @tasks << task_to_add
  end

  def tasks
    @tasks
  end
end
