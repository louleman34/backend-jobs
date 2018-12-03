# model of worker
class Worker
  attr_reader :id, :first_name, :status
  attr_accessor :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @status = attributes[:status]
    @price = 0
  end

  def medic?
    @status == 'medic'
  end

  def interne?
    @status == 'interne'
  end

  def price_in_weekend
    medic? ? @price += SHIFT_PRICE[:medic] * 2 : @price += SHIFT_PRICE[:interne] * 2
  end

  def price_in_week
    medic? ? @price += SHIFT_PRICE[:medic] : @price += SHIFT_PRICE[:interne]
  end
end