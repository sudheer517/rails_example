class LoginController < ApplicationController
session :on 

before_filter :sessionexpire ,:except=>[:login,:authentication]
  

  def sessionexpire
      redirect_to :action=>"login" if session[:current_emp_id].nil?
  end 
  def login
  end

  def authentication
	user=User.find(:first,:conditions=>["mail_id=?",params[:user_name] ]) rescue nil?
	if params[:password]==user.password
		session[:current_emp_id] = user.id.to_s
		respond_to do |format|
		format.html {redirect_to :action=>"user_details",:notice=>"Successfully login"}
		end

	else
		render :action=>"login"
	end
  end

  def registration
  end

  def sub_details
	@user=User.find(:first,:conditions=>["mail_id=?",params[:mail_id] ]) rescue nil?
	if @user.nil?
		User.create(:username=>params[:user_name],:password=>params[:password],:confirm_password=>params[:confirm_password],
:date_of_birth=>params[:dob],:age=>params[:age],:gender=>params[:gender],:course_required=>params[:course],
:fee=>params[:fee],:duration=>params[:duration],:description=>params[:description],:mail_id=>params[:mail_id],
:qualification=>params[:qualification])
	else
@user.update_attributes(:username=>params[:user_name],:password=>params[:password],:confirm_password=>params[:confirm_password],
:date_of_birth=>params[:dob],:age=>params[:age],:gender=>params[:gender],:course_required=>params[:course],
:fee=>params[:fee],:duration=>params[:duration],:description=>params[:description],:mail_id=>params[:mail_id],
:qualification=>params[:qualification])
	end
	respond_to do |format|
		format.html {render :action=>"login"}
	end
  end
def user_details
	@user_details=User.find_all_by_id(session[:current_emp_id])
	
	respond_to do |format|
		format.html
	end
end
def logout
	
end
end
