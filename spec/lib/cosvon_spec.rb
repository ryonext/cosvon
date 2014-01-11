require "spec_helper"

describe Cosvon do
  describe ".parse" do
    [ [ <<-COSVON, 
CoSVON:0.1
DreamCast,SEGA
HI-Saturn,Hitachi
FamiconTV,Sharp
          COSVON
         {
            "DreamCast"=>"SEGA",
            "HI-Saturn"=>"Hitachi",
            "FamiconTV"=>"Sharp",
         }
      ],
      [ <<-COSVON,
CoSVON:0.1
foo,bar
           COSVON
         {
           "foo"=>"bar",
         }
      ],
      [ <<-COSVON,
CoSVON:0.1
comma,"[,]"
dq,"[""]"
n,"[
]"
tab,[	]
           COSVON
        {
          "comma"=>"[,]",
          "dq"=>'["]',
          "n"=>"[\n]",
          "tab"=>"[\t]",
        }
      ],
      [ <<-COSVON,
CoSVON:0.1
SH3,Super Hitachi 3
ATOK,Awa TOKushima
ICU,Isolated Crazy Utopia
BING,Bing Is Not Google
           COSVON
           {
             "SH3"=>"Super Hitachi 3",
             "ATOK"=>"Awa TOKushima",
             "ICU" => "Isolated Crazy Utopia",
             "BING"=>"Bing Is Not Google",
           }
      ],
      [ <<-COSVON,
CoSVON:0.1,,,
Google,Chrome,,
Apple,Safari,"",
Opera,Opera,,""
Mozilla,Firefox,"",""
,,,
,,,
,,,
           COSVON
           {
             "Google"=>"Chrome",
             "Apple"=>"Safari",
             "Opera"=>"Opera",
             "Mozilla"=>"Firefox"
           }
      ],
    ].each do |cosvon, expected|

      it "return hash from Cosvon" do
        expect(described_class.parse(cosvon)).to eq(expected)
      end
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
