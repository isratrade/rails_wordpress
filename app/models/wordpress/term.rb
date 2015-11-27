# +------------+---------------------+------+-----+---------+----------------+
# | Field      | Type                | Null | Key | Default | Extra          |
# +------------+---------------------+------+-----+---------+----------------+
# | term_id    | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
# | name       | varchar(200)        | NO   | MUL |         |                |
# | slug       | varchar(200)        | NO   | UNI |         |                |
# | term_group | bigint(10)          | NO   |     | 0       |                |
# +------------+---------------------+------+-----+---------+----------------+
module Wordpress
  class Term < ActiveRecord::Base
    establish_connection(ENV['WPE_DB_URL'])
    self.table_name = "wp_terms"
    before_save :set_slug_value
    validates :slug, uniqueness: true

    def set_slug_value
      self.slug = self.name.parameterize
    end
  end
end
