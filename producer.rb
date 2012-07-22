Maglev.abort_transaction

Maglev::PERSISTENT_ROOT[:q] ||= []

20.times do |t|
  Maglev::PERSISTENT_ROOT[:q] << Proc.new { sleep 1; puts "job ##{t}" }
end

Maglev.commit_transaction
