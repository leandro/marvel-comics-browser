class ComicBookSerializer
  include JSONAPI::Serializer

  IMAGE_TYPE = 'portrait_fantastic'

  set_key_transform :camel_lower

  attributes :title

  attribute :image do |object|
    url_base, extension = [object.image.path, object.image.extension]

    "#{url_base}/#{IMAGE_TYPE}.#{extension}"
  end
end
