class Variant < ApplicationRecord
  belongs_to :product

  enum variant_type: {:a, :b, :c, :d}
end
