class AdminController < ApplicationController
  # cancan load and auth
  load_and_authorize_resource :class => AdminController


  def index
  end

  def users
  end

  def post
  end
end
