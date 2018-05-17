class LecturesController < InheritedResources::Base
  # before_action :load_and_authorize_resource
  before_action :authenticate_user!, except: %i[index show]

  def comment
    @lecture = Lecture.find(params[:id])
    @user_who_commented = current_user.id
    comment = Comment.build_from(@lecture, @user_who_commented, params[:comment])
    comment.save
    redirect_to lecture_path
  end

  def vote
    @lecture = Lecture.find(params[:id])
    if !current_user.liked? @lecture
      @lecture.liked_by current_user
    elsif current_user.liked? @lecture
      @lecture.unliked_by current_user
    end
    redirect_to lecture_path
 end

  def spam
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_from current_user, vote_scope: 'rank'
    redirect_to lecture_path
   end

  def comment_delete
    @comment = Comment.find(params[:comment])
    @lecture = Lecture.find(params[:lecture])
    @comment.delete
    @comment.save
    redirect_to @lecture
  end

  private

  def lecture_params
    params.require(:lecture).permit(:content, :attachment, :course_id, :user_id)
  end
end
