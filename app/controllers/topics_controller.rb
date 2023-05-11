class TopicsController < ApplicationController

  def create
    @topic_new = Topic.new(topic_params)
    @topic_new.user_id = current_user.id
    @topic_new.save
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])

  end

  def index
    @topics = Topic.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:description, :image)
  end

end
