class Note < ApplicationRecord
	belongs_to :user, :dependent => :destroy
end
