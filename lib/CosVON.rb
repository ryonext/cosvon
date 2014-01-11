require "cosvon/version"
require "csv"

module Cosvon
  class InvalidDataError < StandardError; end

  class << self
    def parse(cosvon)
      raise InvalidDataError unless cosvon.split("\n").first =~ /CoSVON:0\.1/i 
      Hash[CSV.parse(cosvon)[1..-1]]
    end
  end
end
