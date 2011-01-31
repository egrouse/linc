class ApplicationController < ActionController::Base
  before_filter :set_site_path
  
  protect_from_forgery
  
  def set_site_path
    @sitepath = 'http://' + request.env['HTTP_HOST'] + '/'
  end
end
