DEFAULT_BUCKET_SIZE = 5

def bucket_sort(array, bucket_size = DEFAULT_BUCKET_SIZE)
  bucket_count = ((array.max - array.min) / bucket_size).floor + 1

  # create buckets
  buckets = []
  bucket_count.times { buckets.push [] }

  # fill buckets
  array.each do |item|
    buckets[((item - array.min) / bucket_size).floor].push(item)
  end

  # sort buckets
  buckets.each do |bucket|
    bucket.sort!
  end

  buckets.flatten
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p bucket_sort(list)
end
