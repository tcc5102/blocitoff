class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # :authenticate_user! needs to be after forgery
  before_action :authenticate_user!
end
