class TopicController < ApplicationController

  def creaate
    @topic_new = Topic.new(topic_params)
    @topic_new.user_id = current_user.id
    @topic_new.save
    redirect_to topic_path()
  end

  def show
  end

  def index
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
