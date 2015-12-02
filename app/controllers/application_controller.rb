class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :do_NOT_protect_from_CORS
  after_filter :cors_access_headers


  def do_NOT_protect_from_CORS
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = '*'
    head(:ok) if request.request_method == "OPTIONS"
  end

  def cors_access_headers
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = '*'
    end
    head(:ok) if request.request_method == "OPTIONS"
  end

  def options
    head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end
end
