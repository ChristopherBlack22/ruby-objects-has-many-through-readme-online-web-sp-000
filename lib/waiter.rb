# ./lib/customer.rb
# ./lib/meal.rb
require "pry"

class Waiter
  attr_accessor :name, :yrs_experience 
  
  @@all = [] 

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end 
  
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip)
  end
  
  def meals 
    Meal.all.select do |meal|
      meal.waiter == self
    end 
  end 
  
  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end 
    best_tipped_meal.customer
  end 
  
  def most_frequent_customer
        waiters_customers = meals.collect {|meal| meal.customer}
    customers_hash = {}
    waiters_customers.each do |customer|
      customers_hash[customer] += 1
    end 
    value_array = customers_hash.collect {|k,v| v}.sort{|a,b|b<=>a}
    most_frequent = nil
    customers_hash.each do |customer, meals|
      if meals == value_array[0]
        most_frequent = customer
      end
    end 
    most_frequent
  end 
end
binding.pry 