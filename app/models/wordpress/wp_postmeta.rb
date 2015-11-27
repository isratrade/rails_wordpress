module Wordpress
  class WpPostmeta < ActiveRecord::Base
    establish_connection(ENV['WPE_DB_URL'])
    self.table_name = 'wp_postmeta'

    belongs_to :post

  end
end
