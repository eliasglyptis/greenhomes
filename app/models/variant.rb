class Variant < ApplicationRecord
  belongs_to :product

  enum variant_type: {:alpha, :beta, :gamma, :delta, :epsilon}
end
