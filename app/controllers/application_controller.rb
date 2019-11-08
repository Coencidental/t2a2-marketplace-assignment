class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :ensure_location, except: [:new, :create], if: -> { current_user }
  before_action :check_messages, if: -> { current_user }


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  end

  def ensure_location
      if current_user.location == nil 
        redirect_to new_location_path
      end
  end

  def check_messages 
    conversations_received = Conversation.where(receiver_id: current_user.id)
    conversations_sent = Conversation.where(sender_id: current_user.id)
    @unreadmessages = false
    @count = 0
    conversations_received.each do |conversation|
      if !(conversation.unread_message_count(current_user).zero?)
        @count += 1
      end
    end
    conversations_sent.each do |conversation|
      if !(conversation.unread_message_count(current_user).zero?)
        @count += 1
      end
    end
    if @count >= 1
      @unreadmessages = true
    elsif @count == 0
      @unreadmessages = false
    end
  end

end
