class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    @users = User.all.order(created_at: :desc)
    render({ :template => "users/index" })
  end

  def show
    user_id = params.fetch("user_id")
    @user = User.where({ :id => user_id }).first
    render({ :template => "users/show" })
  end

  def create
    @user = User.new
    @user.username = params.fetch("query_username")
    @user.email = params.fetch("query_email")
    @user.private = params.fetch("query_private", false)
    @user.password = params.fetch("query_password")


    if @user.valid?
      @user.save
      redirect_to("/users", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def update
    user_id = params.fetch("path_id")
    @user = User.where({ :id => user_id }).first

    @user.username = params.fetch("query_username")
    @user.email = params.fetch("query_email")
    @user.private = params.fetch("query_private", false)
    @user.comments_count = params.fetch("query_comments_count", 0)
    @user.likes_count = params.fetch("query_likes_count", 0)
    @user.own_photos_count = params.fetch("query_own_photos_count", 0)
    @user.received_follow_requests_count = params.fetch("query_received_follow_requests_count", 0)
    @user.sent_follow_requests_count = params.fetch("query_sent_follow_requests_count", 0)

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.id}", { :notice => "User updated successfully." })
    else
      redirect_to("/users/#{@user.id}", { :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    user_id = params.fetch("path_id")
    @user = User.where({ :id => user_id }).first
    @user.destroy
    redirect_to("/users", { :notice => "User deleted successfully." })
  end
end
