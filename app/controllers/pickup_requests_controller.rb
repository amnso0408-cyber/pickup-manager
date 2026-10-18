class PickupRequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_sales, only: [:new, :create, :destroy]

  def index
    @pickup_requests = PickupRequest.order(created_at: :desc)
    if params[:keyword].present?
      @pickup_requests = @pickup_requests.where("company_name LIKE ? OR items LIKE ? ",
      "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end
    if params[:status].present?
      @pickup_requests = @pickup_requests.where(status: params[:status])
    end
  end

  def show
    @pickup_request = PickupRequest.find(params[:id])
  end

  def new
    @pickup_request = PickupRequest.new
  end

  def create
    @pickup_request = current_user.pickup_requests.build(pickup_request_params)
    if @pickup_request.save
      PickupRequestMailer.created(@pickup_request).deliver_now
      redirect_to @pickup_request, notice: "依頼を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pickup_request = PickupRequest.find(params[:id])
  end

  def update
    @pickup_request = PickupRequest.find(params[:id])

    if @pickup_request.update(pickup_request_params)
      PickupRequestMailer.updated(@pickup_request).deliver_now
      redirect_to @pickup_request, notice: "依頼を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

def destroy
  @pickup_request = PickupRequest.find(params[:id])
  company_name = @pickup_request.company_name
  @pickup_request.destroy
  PickupRequestMailer.destroyed(company_name).deliver_now
  redirect_to pickup_requests_path, notice: "依頼を削除しました", status: :see_other
end

  private

  def pickup_request_params
    if current_user.sales?
      params.require(:pickup_request).permit(:company_name, :address, :items, :desired_period, :notes, :status)
    else
      params.require(:pickup_request).permit(:scheduled_at, :driver_name)
    end
  end

  def require_sales
    unless current_user.sales?
      redirect_to pickup_requests_path, alert: "権限がありません"
    end
  end
end
