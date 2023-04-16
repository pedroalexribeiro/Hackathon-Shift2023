require "eth"

class RegistrationsController < ApplicationController
  skip_before_action :authenticate_freelancer

  def new; end

  def create
    # only proceed with pretty names
    ActiveRecord::Base.transaction do
      @user = Freelancer.create(freelancer_params)
      @user.eth_nonce = SecureRandom.uuid
      # only proceed with eth address
      if @user.eth_address
        # make sure the eth address is valid
        if Eth::Address.new(@user.eth_address).valid?
          # save to database
          if @user.save
            # if user is created, congratulations, send them to login
            redirect_to new_session_path, notice: "Successfully created an account, you may now log in."
          end
        end
      end
    end
  end

  def freelancer_params
    params.require(:freelancer).permit(:email, :eth_address)
  end
end
