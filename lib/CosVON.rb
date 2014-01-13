require "cosvon/version"
require "csv"

module Cosvon
  class InvalidDataError < StandardError; end

  class << self
    def parse(cosvon)
      raise InvalidDataError unless cosvon.split("\n").first =~ /CoSVON:0\.1/i 
      Hash[CSV.parse(cosvon)[1..-1].map do |arr|
        arr.first(2) unless arr[0].to_s.empty? || arr[1].to_s.empty?
      end.compact]
    end
  end
end
