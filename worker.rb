work = "let's do something"
while work do
  Maglev.abort_transaction
  work = Maglev::PERSISTENT_ROOT[:q].shift
  Maglev.commit_transaction
  work.call if work
end
