require "cosvon/version"
require "csv"

module Cosvon
  # Your code goes here...
  class << self
    def parse(cosvon)
      Hash[CSV.parse(cosvon)[1..-1]]
    end
  end
end
