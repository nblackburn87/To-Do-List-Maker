class Task
  def initialize(description, rank, date)
    @description = description
    @priority = rank
    @due_date = Date.parse(date)
  end

  def description
    @description
  end

  def priority
    @priority
  end

  def due_date
    @due_date
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

  def sort_by_date
    @tasks.sort! { |x, y| x.due_date <=> y.due_date}
  end

  def sort_by_priority
    @tasks.sort! { |x, y| x.priority <=> y.priority}
  end
end
