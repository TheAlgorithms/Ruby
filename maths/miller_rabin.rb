module Primes
  module MillerRabin
    module_function

    def prime?(num, precision = 10)
      return true if num == 2
      return false if num.even? || num <= 1

      d = num - 1
      s = 0

      while d.even?
        d /= 2
        s += 1
      end

      precision.times do
        a = 2 + rand(num - 4)
        x = a.pow(d, num)       # x = (a**d) % n
        next if x == 1 || x == num - 1

        (s - 1).times do
          x = x.pow(2, num)     # x = (x**2) % n
          return false if x == 1

          break if x == num - 1
        end
        return false if x != num - 1
      end

      true
    end
  end
end
