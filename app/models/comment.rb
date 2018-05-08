class Comment < ApplicationRecord
    validates :body, presence: { message: 'Body Must Be Filled' }
    validates :user_id, presence: { message: 'User Doesn\'t Exists' }
    validates :lecture_id, presence: { message: 'Lecture Doesn\'t Exists' }

    belongs_to :user
    belongs_to :lecture
end
