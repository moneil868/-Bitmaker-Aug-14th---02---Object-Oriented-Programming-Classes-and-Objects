# Create a class called Player.
class Player
  # Every player should have four attributes: gold_coins, health_points, and lives
      def initialize
        # lives should start at 5.
        # gold_coins should start at 0.
        # health_points should start at 10.
        @gold_coins = 0
        @health_points = 10
        @lives = 5

      end

      # Your class should have an instance method called level_up that increases lives by one.
      def level_up
        @lives += 1
      end

      # Your class should have an instance method called collect_treasure that increases gold_coins by one. If gold_coins is a multiple of ten (eg, 10, 20, 30, and so on) then the collect_treasure method should run the level_up method.
      def collect_treasure
        @gold_coins += 1
        if @gold_coins % 10 == 0
          level_up
        end
      end

      # Your class should have an instance method called do_battle that accepts one damage argument and subtracts it from the player's health_points. If health_points falls below one, subtract one from lives and reset health_points to ten. If you have run out of lives, this method should run another method called restart (see below).
      def do_battle(damage)
          @health_points = @health_points - damage
          if @health_points < 1
            @lives -= 1
            @health_points = 10
          end

          if @lives == 0
            reset
          end

      end

      # The restart instance method should set all attributes back to their starting values (5, 0, and 10).
      def reset
        @gold_coins = 0
        @health_points = 10
        @lives = 5
      end

      def show_life
        @lives
      end

      def show_health
        @health_points
      end

      def show_coins
        @gold_coins
      end

end

#Testing of Methods

marlon = Player.new
puts "Player Marlon has #{marlon.show_life} lives remaining"
puts "Player Marlon has #{marlon.show_health} health points left"
puts "Player Marlon has #{marlon.show_coins} gold coins"

marlon.collect_treasure
puts "Player Marlon has #{marlon.show_coins} gold coins"

Testing level up Method
puts
puts "Testing level up Method"
marlon.level_up
puts "Player Marlon has #{marlon.show_life} lives remaining"

Testing damage Method
puts
puts "Testing damage Method"
marlon.do_battle(3)
puts "Player Marlon received 3 damage"
puts "Player Marlon has #{marlon.show_health} health points left"
puts
marlon.do_battle(10)
puts "Player Marlon received 7 damage"
puts "Player Marlon has #{marlon.show_health} health points left" #Health points should be 0
puts "Player Marlon has #{marlon.show_life} lives remaining" #Lives should be 5

#Testing reset Method
puts
puts "Testing reset Method"
marlon.reset
puts "Player Marlon has #{marlon.show_life} lives remaining"
puts "Player Marlon has #{marlon.show_health} health points left"
puts "Player Marlon has #{marlon.show_coins} gold coins"
