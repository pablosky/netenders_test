class CircularPrime

  # using calculated as cache 
  # as the included? method is not very fast to search inside big arrays so am adding binary search
  
  attr_accessor :limit, :calculated
  
  def initialize(limit: )
    @limit = limit
    @calculated = []
  end

  def find_number(array, number)
    #include? its O(n) and too slow for big calculations
    left = 0;
    right = array.length - 1;

    while (left <= right)
      middle = left + ((right - left)/2);
      if (array[middle]==number)
        return true
      elsif (array[middle] < number)
        left = middle  + 1
      elsif (array[middle] > number)
        right = middle  - 1 
      end
    end
    false
  end

  def is_prime?(number)
    return false if (number !=2 && number % 2 == 0) || number < 2
    return true if find_number(calculated, number)
    for i in 2..number-1
      return false if number % i == 0
    end
    calculated.push(number)
    true
  end

  def count_digits(number)
    digit = 0;
    while ((number /= 10) > 0)
        digit +=1
    end
    digit
  end
 
  #  Rotate function to right rotate the number
  def rotate(number)
    rem = number % 10; 
    rem *= (10 ** count_digits(number))
    number /= 10
    number += rem
    number
  end

  def is_circular_prime?(number)
    digits = count_digits(number)
    for i in 0..digits
      number = rotate(number)
      return false if number > limit
      return false if !is_prime?(number)
    end
    true
  end

  def circular_primes
    calculate_primes
    c_primes = []
    calculated.each do |number|
      if find_number(c_primes, number)
        next
      elsif is_circular_prime?(number)
        c_primes.push(number)
      end
    end
    c_primes
  end


  def calculate_primes
    # Sieve of Sundaram algorithm
    return [] if limit < 2
    calculated.push(2) if limit >= 2
    k = (limit - 1) / 2 
    integers_list = Array.new(k+1, true)
    for i in 1..k+1
      j = i
      while(i + j + 2 * i * j <= k) do
        integers_list[i + j + 2 * i * j] = false
        j += 1
      end
    end

    for i in 1..k+1
      if integers_list[i]
        calculated.push(2 * i + 1)
      end
    end
    calculated
  end

end