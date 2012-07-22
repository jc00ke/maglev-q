#!/usr/bin/env maglev-ruby

require 'maglev/rcqueue'

keep_looping = true

trap(:INT) { keep_looping = false }

while keep_looping do
  begin
    Maglev.abort_transaction
    work = Maglev::PERSISTENT_ROOT[:q].shift
    Maglev.commit_transaction
    if work
      work.call
    else
      print "."
    end
    sleep 0.3
  rescue Maglev::CommitFailedException
    puts "Dang, someone hijacked my job... gonna grab another."
    redo
  end
end
