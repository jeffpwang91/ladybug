class LogsController < ApplicationController

def new

 @log = Log.new

end

def create
 @log =  current_user.logs.build(logs_params)

 if @log.valid?
  @log.save
  redirect_to user_path(current_user.id)
  # flash[:notice] = "Success! Log successfully created."

 else
  render 'new'
 end
end

def show
  @log = Log.find(params[:id])
end

private

def logs_params
 params.require(:log).permit(:tag_new, :content, :before_rating, :after_rating, :belief_id, :distortion_id, :lady_bug_ids => [], :tag_ids => [])
end

end
