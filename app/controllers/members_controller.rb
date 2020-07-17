class MembersController < ApplicationController

	def show
		@member = current_member
	end

	def edit
	  @member = Member.find(params[:id])
	end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number)
  end

end
