#Create a class called Cat
class Cat
# Every cat should have three attributes when they're created: name, preferred_food and meal_time
  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  # Add an instance method called eats_at that returns the hour of the day with AM or PM that this cat eats.
  # The return value should be something like "11 AM" or "3 PM"
  def eats_at
    if @meal_time.to_i < 12
      "#{@meal_time}AM"
    elsif @meal_time == 12
      "#{@meal_time}PM"
    else
      @meal_time = @meal_time - 12
      "#{@meal_time}PM"
    end
  end

  def get_name
    @name
  end

# Add another instance method called meow that returns a string of the cat telling you all about itself
  def meow
    # The return value should be something like "My name is Sparkles and I eat tuna at 11 AM"
    "My name is #{ @name } and I eat #{ @preferred_food } at #{ eats_at }"
  end

end

# Create two instances of the Cat class in your file
  # They should each have unique names, preferred foods and meal times
  # Let's assume meal_time is an integer from 0 to 23
cat_one = Cat.new("Bubbles", "tuna fish", 12)
cat_two = Cat.new("Zazzles", "sardines", 20)
puts "The cat named #{cat_one.get_name} eats at #{cat_one.eats_at}"
puts "The cat named #{cat_two.get_name} eats at #{cat_two.eats_at}"



# Call the meow method on each of the cats you instantiated in Step 3
# Use puts to have the program output the result to the terminal
puts cat_one.meow
puts cat_two.meow
