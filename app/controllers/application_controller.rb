class ApplicationController < ActionController::API
  # before_action :current_category

  # def current_category
  #   @current_category = Category.find_by(name: params[:category_name])
  # end

  def render_status(status)
    render status: status
  end
end
