class Car < Base
  attr_accessor :id, :price_per_day, :price_per_km

  def self.root_key
    "cars"
  end

  def self.import_fields
    %w[id price_per_day price_per_km]
  end

  def price_per_day=(price)
    @price_per_day = price.to_i
  end

  def price_per_km=(price)
    @price_per_km = price.to_i
  end
end
