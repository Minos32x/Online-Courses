class Lecture < ApplicationRecord
    validates :content, presence: { message: 'must be filled' }
    validates :attachment, presence: { message: 'must be uploaded' }
    validates :user_id, presence: { message: 'User Doesn\'t Exists' }
    validates :course_id, presence: { message: 'must be selected' }

    belongs_to :user
    belongs_to :course
    has_many :comments, dependent: :destroy

    mount_uploader :attachment, AttachmentUploader
    
end
