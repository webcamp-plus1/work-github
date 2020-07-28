class MembersController < ApplicationController
  before_action :authenticate_member!

	def show
		@member = current_member
	end

	def edit
	  @member = current_member
	end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to members_mypage_path, notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def unsubscribe_screen
  end

  def unsubscribe
    @member = current_member
    @member.update(is_unsubscribe_status: true)
    reset_session
    flash[:notice] = "ありがとうございました、またのご利用を心からお待ちしております。"
    redirect_to new_member_session_path
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number, :is_unsubscribe_status)
  end
end
