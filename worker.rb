work = "let's do something"
while work do
  begin
    Maglev.abort_transaction
    work = Maglev::PERSISTENT_ROOT[:q].shift
    nap_time = rand(3)
    puts "\n\n\n"
    puts "sleeping for #{nap_time} seconds after de-queing"
    sleep nap_time
    Maglev.commit_transaction
    work.call if work
  rescue Maglev::CommitFailedException
    puts "job failed :-( REDO!"
    redo
  end
end
