#!/usr/bin/env ruby

path = ARGV[0]

#fd = File.open("/sys/class/gpio/gpio203/value", "r")
fd = File.open(path, "r")

loop do
  rs,ws,es = IO.select(nil, nil, [fd])
  if es
    r = es[0]
    puts r.read()
    STDOUT.flush
    r.rewind
  else
    STDERR.print [rs, ws, es].inspect
  end
end
