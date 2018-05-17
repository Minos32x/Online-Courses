class CoursesController < InheritedResources::Base
  # before_action :load_and_authorize_resource
  before_action :authenticate_user!, except: %i[index show]

  private

  def course_params
    params.require(:course).permit(:title, :user_id)
  end
end
