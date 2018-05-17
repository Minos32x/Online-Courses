class Lecture < ApplicationRecord
    validates :content, presence: { message: 'must be filled' }
    validates :attachment, presence: { message: 'must be uploaded' }
    validates :user_id, presence: { message: 'User Doesn\'t Exists' }
    validates :course_id, presence: { message: 'must be selected' }

    belongs_to :user
    belongs_to :course
    acts_as_votable
    acts_as_commentable
    

    mount_uploader :attachment, AttachmentUploader
    
end
