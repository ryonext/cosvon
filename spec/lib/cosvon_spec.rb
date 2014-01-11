require "spec_helper"

describe Cosvon do
  describe ".parse" do
    it "return hash from Cosvon" do
      result = described_class.parse(<<-COSVON)
CoSVON:0.1
DreamCast,SEGA
HI-Saturn,Hitachi
FamiconTV,Sharp
                            COSVON

      expect(result).to eq(
        "DreamCast"=>"SEGA",
        "HI-Saturn"=>"Hitachi",
        "FamiconTV"=>"Sharp",
      )
    end
    context "Invalid data" do
      context "which does'nt start with cosvon type" do
        it "raise Cosvon Invalid Data error." do
          expect { described_class.parse("hoge") }.to raise_exception(Cosvon::InvalidDataError)
        end
        #TODO Cosvon::001 is NG
      end
    end

  end
end
