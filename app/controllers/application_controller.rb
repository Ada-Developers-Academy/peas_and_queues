class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_action :weather_report

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
    redirect_to root_path
  end
  helper_method :current_user

  def weather_report
    @weather_report = cache('weather_report', expires_in: 1.hour) do
      WeatherReport.current_weather
    end
  end
end
