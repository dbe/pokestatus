class SubscribersController < ApplicationController
  def create
    begin
      sub = Subscriber.create(:email => params[:email], :ip => request.remote_ip)

      if sub
        return head :ok
      end
    rescue
    end

    return head :bad_request
  end
end
