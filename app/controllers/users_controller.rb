class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_patha(@user.id)
  end
  
  private
  def user_params
    params.rwquire(:user).permit(:name,:profile_image)
  end
end
