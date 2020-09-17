class Rental < Base
  attr_accessor :id, :car_id, :start_date, :end_date, :distance

  def self.root_key
    "rentals"
  end

  def self.import_fields
    %w[id car_id start_date end_date distance]
  end

  def self.export_fields
    %w[id price]
  end

  def start_date=(date)
    date = Date.parse(date)  if date.is_a? String
    @start_date = date
  end

  def end_date=(date)
    date = Date.parse(date)  if date.is_a? String
    @end_date = date
  end

  def distance=(dist)
    @distance = dist.to_i
  end

  def car
    @car ||= Car.find(car_id)
  end

  def rental_days
    (end_date - start_date).to_i + 1
  end

  def price_for_days
    car.price_per_day * rental_days
  end

  def price_for_kms
    car.price_per_km * distance
  end

  def price
    price_for_days + price_for_kms
  end
end
