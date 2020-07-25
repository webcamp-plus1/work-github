class Admins::MembersController < ApplicationController

  def top
     # 今日の注文数
    count_order = Order.where('created_at > ?', Time.current.beginning_of_day).where('created_at < ?', Time.current.end_of_day)
    @count = count_order.count
  end

  def index
  	@members = Member.all
  end

  def show
	@member = Member.find(params[:id])
  end

  def edit
	@member = Member.find(params[:id])
  end
  def update
  @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admins_member_path(@member.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_unsubscribe_status)
  end

end
