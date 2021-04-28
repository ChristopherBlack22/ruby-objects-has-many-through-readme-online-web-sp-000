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
    #go through the waiters meals and gather all their waiters_customers
    #go through each customers meals and select those where they had this waiter 
    waiters_customers = meals.collect do |meal|
      meal.customer
    end 
    waiters_customers.each 
  end 
end