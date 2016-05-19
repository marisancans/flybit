class SupportMessagesController < ApplicationController

	def new
		@support_message = SupportMessage.new
	end

	 def create
      @support_message = SupportMessage.new(support_message_params)
      if @support_message.save
        redirect_to root_url
      else
        render :new
      end
    end

    def support_message_params
      params.require(:support_message).permit(:email, :content)
    end

end
