require "benchmark"
require "pp"

COMMANDS = [
  [ "php for.php", "php" ],
  [ "node for_pp.js", "node" ],
  [ "python3 for_range.py", "python3" ],
  [ "ruby times.rb", "ruby" ],
]

COUNTS = (10..27).map{ |e| 2**e }

File.open( "result.csv", "w" ) do |f|
  f.puts( (["tick"]+COMMANDS.map{ |cmd| cmd[1] }).join(",") )
  COUNTS.each do |count|
    s=([count]+COMMANDS.map{ |cmd|
      Benchmark.realtime{ %x(#{cmd[0]} #{count}) }
    }).join(",")
    f.puts(s)
    puts(s)
  end
end
