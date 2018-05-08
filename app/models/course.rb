class Course < ApplicationRecord
    validates :title, presence: { message: 'Course Title Must Be Filled' }
    validates :title, uniqueness: { message: 'Course Name Already Exists' }
    validates :user_id, presence: { message: 'must be filled' }

    belongs_to :user
    has_many :lectures ,dependent: :destroy

end
