class CompsController < ApplicationController
  
  
  QUICK_FACT = Hash["" => nil,
                    "Source" => "Source",
                    "Hours" => "Hours","Serving"=>"Serving","Insurances" => "Insurances","Time" => "Time","Address"=> "Address"]
                  
  def quick_facts
    puts "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
  end
  
  def priceDescription
    @quick_facts= QUICK_FACT
    puts "SDFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA"
  end
end
