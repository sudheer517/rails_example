
class SiteController < ApplicationController
def about
redirect_to :action => :index
end
def contact
redirect_to :action => :contacts
end
end
