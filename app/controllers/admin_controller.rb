class AdminController < ApplicationController
session :on 

before_filter :sessionexpire ,:except=>[:login,:authentication]
  

  def admin_login
	session[:login] = 1
  end
 
  def logout
    session[:login] = nil
    session[:cart] = nil
    flash[:notice] = "user logged out, cart reset."
    redirect_to :controller => :items
  end
	
  end

  