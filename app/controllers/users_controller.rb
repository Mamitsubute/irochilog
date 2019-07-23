class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    render html: "", layout: true
  end
end
