class Alert < ApplicationRecord
	 self.inheritance_column = nil
	 validates :type, presence: true, 
	 inclusion: { in: %w[portal_opened Portal_opened portal_closed Portal_closed], 
     message: "It's neither portal_opened nor portal_closed" }
     validates :tag, presence: {message: 'must exists. must be an array'}
     validates :description, presence: true
     validates :origin, presence: true, format: {with: /\A[0-9]([0-9.]*[0-9])?\z/, message: 'Invalid origin'}
end
