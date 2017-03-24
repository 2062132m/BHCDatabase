# ApplicationRecord is the super class for other ActiveRecord models.
# Currently unused.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
