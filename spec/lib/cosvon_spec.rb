require "spec_helper"

describe Cosvon do
  it { true }
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
  end
end
