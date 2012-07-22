#!/usr/bin/env maglev-ruby

require 'maglev/rcqueue'

Maglev.abort_transaction

Maglev::PERSISTENT_ROOT[:q] ||= RCQueue.new

keep_looping = true

trap(:INT) { keep_looping = false }

while keep_looping do
  r = rand
  Maglev::PERSISTENT_ROOT[:q] << Proc.new { puts "doing work #{Time.now.to_i}" }
  Maglev.commit_transaction
  sleep r
  print "."
end

