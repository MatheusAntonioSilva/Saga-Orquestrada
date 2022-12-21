module ErrorSerializer
  class Base < ActiveModel::Serializer

    type :error

    attribute(:tag) { object.class.name }
    attribute(:error) { object.message }
  end
end
