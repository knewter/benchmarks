require 'benchmark'

num_iterations = 1_000_000

counter = 0

logic_hash = {
  1 => true,
  2 => false
}

c = Class.new

start_time = Time.now

bm = Benchmark.measure do
  num_iterations.times do |i|
    200.times do
      c.new # Generate objects per pass
      logic_hash[i % 2] # Look up some data in a bizlogic table
    end
    counter += 1
  end
end

end_time = Time.now
duration = end_time - start_time

puts counter
puts bm
tps = num_iterations / duration
puts "TPS: #{tps}"
