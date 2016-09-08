require "application_responder"
require 'json'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def to_integer(number)
    number = number.to_f * 100
    number.round
  end

end
