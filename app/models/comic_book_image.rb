class ComicBookImage < Dry::Struct
  transform_keys(&:to_sym)

  attribute :extension, Types::String
  attribute :path, Types::String
end
