class ApplicationController < ActionController::API
  def serialize(record, serializer)
    envelope(serializer.new(record))
  end

  private def envelope(data)
    {
      id: data.try(:id),
      type: data.try(:type),
      data: data
    }
  end
end
