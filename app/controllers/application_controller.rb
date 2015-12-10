class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  ContentType = "application/vnd.api+json"

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def record_not_found(exception)
    response_with_error(404, "not_found", "Not Found", "Sorry,  #{exception.message}.")
  end

  def response_with_error(code, status, title, detail)
    error = {"errors":[{"title":title,"detail":detail,"code":code, "status":status}]}
    respond(code, error.as_json)
  end

  def respond(http_status_code, options=nil)
    render json: options, content_type: ContentType, status: http_status_code
  end
end
