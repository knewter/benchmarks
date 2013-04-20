require 'benchmark'

counter = 0

c = Class.new

bm = Benchmark.measure do
  500_000_000.times do
    20_000.times do
      c.new # Generate 20k objects per pass
    end
    counter += 1
  end
end

puts counter
puts bm
