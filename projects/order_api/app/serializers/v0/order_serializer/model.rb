module V0
  module OrderSerializer
    class Model < V0::ApplicationSerializer::Model
      attributes :id, :description, :order_id

      attribute(:created_at) { object.created_at.as_json }
      attribute(:updated_at) { object.updated_at.as_json }
    end
  end
end
