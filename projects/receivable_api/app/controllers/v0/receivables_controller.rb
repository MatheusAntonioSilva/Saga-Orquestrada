class ::V0::ReceivablesController < ::V0::ApplicationController

  def create
    creator = ::ReceivableManager::Creator.new(receivable_params)
    render json: creator.create, status: :created, serializer: ::V0::ReceivableSerializer::Model
  end

  def destroy
    destroyer = ::ReceivableManager::Destroyer.new(params.permit(:order_id))
    destroyer.destroy
    render head: 'ok', status: :success
  end

  private

  def receivable_params
    params.permit(:description, :order_id)
  end
end
