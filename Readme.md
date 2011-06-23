A *very* simple implementation of a background queue/worker.
The cool part: we're calling a proc. Since Maglev deals with real objects we can actually persist
a proc, which you can't do in other implementations because you can't marshal a proc.

The following code assumes you're using [RVM](https://rvm.beginrescueend.com)
Open up 3 terminals (all using Maglev) and in the first run:

  ruby queue.rb

And in the other 2 run:

  ruby worker.rb

Each worker will start pulling "jobs" off the queue and do them.
