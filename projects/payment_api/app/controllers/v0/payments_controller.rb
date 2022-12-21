class ::V0::PaymentsController < ::V0::ApplicationController

  def create
    creator = ::PaymentManager::Creator.new(payment_params)
    render json: creator.create, status: :created, serializer: ::V0::PaymentSerializer::Model
  end

  def destroy
    destroyer = ::PaymentManager::Destroyer.new(params.permit(:id))
    render json: destroyer.destroy, status: :success, serializer: ::V0::PaymentSerializer::Model
  end

  private

  def payment_params
    params.permit(:flag, :card_reference, :split, :order_id)
  end
end
