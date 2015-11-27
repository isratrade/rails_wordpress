module Wordpress
  class User < ActiveRecord::Base
    establish_connection(ENV['WPE_DB_URL'])
    self.table_name = "wp_users"

    has_many :posts, foreign_key: :post_author
  end
end
