class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:update, :destroy]
end
