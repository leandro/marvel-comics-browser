class ComicBook < Dry::Struct
  transform_keys(&:to_sym)

  attribute :id, Types::Coercible::Integer
  attribute :images, Types::Array(Types::Constructor(ComicBookImage))
  attribute :title, Types::String

  def image
    images.first
  end
end
