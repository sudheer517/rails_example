# encoding: utf-8
class UserController < ApplicationController

  def admin_log
    session[:login] = 1
    session[:cart] = nil
    flash[:notice] = "Admin  successfully logged in, cart reset."
    redirect_to :controller => :items
  end

  def logout
    session[:login] = nil
    session[:cart] = nil
    flash[:notice] = "admin logged out, cart reset."
    redirect_to :controller => :items
  end
end
