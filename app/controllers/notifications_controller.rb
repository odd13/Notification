class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      #redirect_to :action => 'index' #render 'notifications/index' # Handle a successful save.
      redirect_to '/notifications'
    else
      redirect_to '/notifications/new'  #render 'notifications/new'
    end
  end

  def show
    @notification = Notification.find(params[:id])
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    flash[:success] = "notification deleted"
    redirect_to '/notifications'
  end

  def edit
    @notification = Notification.find(params[:id])
  end

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(notification_params)
      @notification.save
      redirect_to action: :index
    else
      render 'notifications/edit'
    end
  end

  private

    def notification_params
      params.require(:notification).permit(:name, :description, :loggedBy)
    end
end
