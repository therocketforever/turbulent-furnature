class BaseSerializer
  include JSONAPI::Serializer

  attribute :created_at
  attribute :updated_at

  def relationship_self_link(attribute_name)
    nil
  end

end
