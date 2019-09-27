require 'active_record'
require './db/migrations/create_user'
require './db/migrations/create_spaces'
require './db/migrations/create_bookings'


def setup_test_connection
  'database setup running'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'makersbnb_test'
  )

  drop_tables
  create_tables
end

def drop_tables
  CreateBooking.migrate(:down) if ActiveRecord::Base.connection.table_exists?(:bookings)
  CreateSpace.migrate(:down) if ActiveRecord::Base.connection.table_exists?(:spaces)
  CreateUser.migrate(:down) if ActiveRecord::Base.connection.table_exists?(:users)
end

def create_tables
  CreateSpace.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:spaces)
  CreateUser.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:users)
  CreateBooking.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:bookings)
end

def setup_prod_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'makersbnb'
  )
end

ENV['DB_ENV'] == 'test' ? setup_test_connection : setup_prod_connection
