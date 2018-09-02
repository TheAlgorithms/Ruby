require 'prime'
class Prime
  def self.nth(nth_number)
    raise ArgumentError if nth_number==0
    Prime.take(nth_number).last
  end
end