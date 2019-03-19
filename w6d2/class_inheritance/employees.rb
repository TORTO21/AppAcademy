class Employee
    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = 
        name, title, salary, boss
    end

    def bonus(multiplier)
        salary * multiplier
    end

    private

    attr_accessor :name, :title, :salary, :boss
end

class Manager < Employee
    def initialize(name, title, salary, boss)
       @employees = [1,2]
    end

    def calculate_subs_salary
        return  if 
    end
end