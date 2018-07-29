class Station < ApplicationRecord
  enum status: [:using, :abandoned]
end
