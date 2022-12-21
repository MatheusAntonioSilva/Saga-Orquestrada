class ::V0::OrdersController < ::V0::ApplicationController

  def create
    creator = ::OrderManager::Creator.new(order_params)
    render json: creator.create, status: :created, serializer: ::V0::OrderSerializer::Model
  end

  private

  def order_params
    params.permit(:description, :amount, customer: [:name, :phone], payment: [:flag, :card_reference, :split])
  end
end
