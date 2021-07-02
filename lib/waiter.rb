require "pry"
require_relative "./meal"
require_relative "./customer"
class Waiter
    @@all = []

    def self.all
        @@all
    end

    attr_reader :name, :experience
    def initialize name, experience
        @name = name
        @experience = experience
        @@all << self
    end

    def new_meal customer, total, tip
        Meal.new(self,customer,total,tip)
    end

    def meals 
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        #call meals and compare the tips with max_by
        self.meals.max_by{|obj| obj.tip }.customer
    end


end

# howard = Customer.new("Howard", 30)
# daniel = Customer.new("Daniel", 30)
# lisa = Customer.new("Lisa", 27)
# josh = Customer.new("Josh", 31)
# steven = Customer.new("Steven", 28)
# terrance = Waiter.new("Terrance", 1)


# howard.new_meal(terrance, 15, 2)
# daniel.new_meal(terrance, 15, 4)
# lisa.new_meal(terrance, 15, 5)
# josh.new_meal(terrance, 15, 1)
# steven.new_meal(terrance, 15, 3)

# binding.pry