class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_session

  def permission_denied
    respond_to do |format|
      flash[:error] = "Sorry, you not allowed to access that page."
      format.html { redirect_to login_path }
    end
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end
