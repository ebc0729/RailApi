class Company < ApplicationRecord
  enum status: [:using, :abandoned]
end
