require 'active_record'
require './db/migrations/create_user'
def setup_test_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'makersbnb_test'
  )

  drop_tables
  create_tables
end

def drop_tables
  CreateUser.migrate(:down) if ActiveRecord::Base.connection.table_exists?(:users)
end

def create_tables
  CreateUser.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:users)
end

def setup_prod_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'makersbnb'
  )
end

ENV['DB_ENV'] == 'test' ? setup_test_connection : setup_prod_connection
