class PickupRequestsController < ApplicationController
    before_action :authenticate_user!

  def index
    @pickup_requests = PickupRequest.order(created_at: :desc)
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
      redirect_to @pickup_request, notice: "依頼を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

def destroy
  @pickup_request = PickupRequest.find(params[:id])
  @pickup_request.destroy
  redirect_to pickup_requests_path, notice: "依頼を削除しました", status: :see_other
end

  private

  def pickup_request_params
    params.require(:pickup_request).permit(:company_name, :address, :items, :desired_period, :notes, :scheduled_at, :driver_name, :status)
  end

end
