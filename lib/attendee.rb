class Attendee
  attr_reader :name,
              :budget
  def initialize(name: name, budget: budget)
    @name = name
    @budget = budget.delete("$").to_i
  end
end
