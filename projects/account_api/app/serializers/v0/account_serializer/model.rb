module V0
  module AccountSerializer
    class Model < V0::ApplicationSerializer::Model
      attributes :id, :name, :phone, :order_id

      attribute(:created_at) { object.created_at.as_json }
      attribute(:updated_at) { object.updated_at.as_json }
    end
  end
end
