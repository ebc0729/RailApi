class Record < ApplicationRecord
  belongs_to :user
  belongs_to :route
end
