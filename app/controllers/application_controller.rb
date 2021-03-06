class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.json { head :forbidden, content_type: "text/html" }
      format.js { head :forbidden, content_type: "text/html" }
    end
  end
end
