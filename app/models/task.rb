class Task < ApplicationRecord
   validates :title, presence: true, length: { maximum: 10 }
end
