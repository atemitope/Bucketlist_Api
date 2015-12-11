require "jwt"
require 'application_controller.rb'

class AuthToken < ApplicationController
  def self.encode(payload, exp=24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    # rescue JWT::ExpiredSignature
    #   raise "Your token has expired"# @expired
    # rescue JWT::DecodeError
    #   raise "invalid token" # render json: { error: 'Invalid token' } ; false
  end
end