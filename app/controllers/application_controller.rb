class ApplicationController < ActionController::Base

  # rescue_from StandardError, with: :render_500
  # rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :render_404

  # def render_404
  #   render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  # end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_path, alert: "権限がないのでアクセスできません" }
    end
  end
end
