#!/usr/bin/env maglev-ruby

require 'maglev/rcqueue'

Maglev.abort_transaction

Maglev::PERSISTENT_ROOT[:q].clear

Maglev.commit_transaction
