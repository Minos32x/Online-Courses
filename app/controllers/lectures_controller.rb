class LecturesController < InheritedResources::Base
  before_action :authenticate_user!, except: [:index,:show]
  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment,:course_id,:user_id)
    end
end

