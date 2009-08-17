# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def load_page
    @page = params[:page] || '1'
    @per_page = (params[:limit] || '30').to_i
    @per_page = 30 if @per_page > 30
    true
  end

end

