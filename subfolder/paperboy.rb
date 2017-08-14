class Paperboy

  def initialize(name)
  # Each paperboy should have several attributes:
    # Name
    # Experience (the number of papers they've delivered)
    # Earnings (amount of money they've earned)
      # This needs to be read-only!
      @name = name
      @experience = 0
      @earnings = 0

      # They get paid $0.25 for every paper they deliver
      @paper_delivery_fee = 0.25
      # and $0.50 for every paper over their quota.
      @paper_over_quota_fee = 0.50
      # If at the end of the day they haven't met their quota, they lose $2.
      @quota_penalty_fee = 2.00
      # The minimum number of papers to deliver is 50.
      @minimum_quota = 50

  end

  # The quota is calculated as half of your experience added to the minimum.
  def quota
    if @experience == 0
      # So the first time a paperboy makes a delivery, the quota is 50.
      @minimum_quota = 50
    else
      # The next time, the quota is 50 plus half the number of papers that the paperboy has delivered in the past. In this way the quota should increase after every delivery the paperboy makes.
      @minimum_quota = 50 + (@experience / 2)
    end
  end

  # Every day, each paperboy is given a house number to start at and a house number to finish at.
  # This method will take two house numbers and return the amount of money earned on this delivery as a floating point number. It should also update the paperboy's experience!
  def deliver(start_address, end_address)
    #get total numbers of papers delivered
    amount_delivered = (end_address - start_address) +1 #Offset's the house numbers
    if @experience == 0
      @experience = amount_delivered
    else
      @experience = @experience + amount_delivered
    end

    extra_earnings = 0
    quota_earnings = 0

    #calculate how much papers were over the quota
    if amount_delivered > @minimum_quota
      quota_delivered = @minimum_quota
      extra_earnings = amount_delivered - @minimum_quota
    else
      quota_delivered = amount_delivered
      quota_earnings = quota_earnings - @quota_penalty_fee
    end

    quota_earnings = quota_earnings + (quota_delivered * @paper_delivery_fee)
    extra_earnings = extra_earnings * @paper_over_quota_fee
    @earnings = @earnings + (quota_earnings + extra_earnings)
  end


  def get_name
    @name
  end

  def get_earnings
    @earnings
  end

  def get_experience
    @experience
  end

end


tommy = Paperboy.new("Tommy")
puts "#{tommy.get_name}'s quota when he starts is #{tommy.quota}."


#Test One
tommy.deliver(101, 160)
puts "I'm #{tommy.get_name}, I've delivered #{tommy.get_experience} papers and I've earned #{tommy.get_earnings} so far!"

#Test two
puts "#{tommy.get_name}'s new quota is #{tommy.quota}."
tommy.deliver(1, 75)
puts "I'm #{tommy.get_name}, I've delivered #{tommy.get_experience} papers and I've earned #{tommy.get_earnings} so far!"
