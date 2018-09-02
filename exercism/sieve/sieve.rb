class Sieve
  def initialize(given)
    @number=given
  end
  def primes
    number_arr=(2..@number).to_a
    j=-1
    (0..number_arr.length/4).each do |i|
      if number_arr[i]==0
        j+=1
      else
        j+=1
        small=number_arr[j]
        (j+1..number_arr.length-1).each do |index|
          number_arr[index]=0 if number_arr[index]%small==0
        end
      end
    end
    number_arr=number_arr.uniq
    number_arr-=[0]
  end
end