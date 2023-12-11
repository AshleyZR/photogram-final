class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    @users = User.all.order({ :created_at => :desc })
    render({ :template => "users/index" })
  end

  def show
    username = params.fetch("username")
    @the_user = User.where({ :username => username }).first
    render({ :template => "users/show" })
  end


  #def destroy
    #user_id = params.fetch("path_id")
    #@user = User.where({ :id => user_id }).first
    #@user.destroy
    #redirect_to("/users", { :notice => "User deleted successfully." })
  #end
end
