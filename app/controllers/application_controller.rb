require "application_responder"
require 'json'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
