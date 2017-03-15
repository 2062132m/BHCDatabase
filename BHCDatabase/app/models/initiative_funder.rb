class InitiativeFunder < ApplicationRecord
  belongs_to :funder
  belongs_to :initiative
end
