work = "let's do something"
while work do
  begin
    Maglev.abort_transaction
    work = Maglev::PERSISTENT_ROOT[:q].shift
    Maglev.commit_transaction
    work.call if work
  rescue Maglev::CommitFailedException
    puts "Dang, someone hijacked my job... gonna grab another."
    redo
  end
end
