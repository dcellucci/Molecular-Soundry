# Vispectra

include Math
class Vispectra < Processing::App

  def setup
    f = File.open("molecules/data/rp5.1400.unrot.spec.total.912.txt")
    @bwvals = []
    f.readlines.each {|line|
    	line = line.split(" ")
    	line.map!{|i| i.to_f}
#    	line[1] = line[1]+1
    	@bwvals << line
    }
    background 0
    stroke(0,0,0,255)  
  end
  
  def draw
#    ratio = Math.log(pmouse_x+1)/Math.log(601.0)
    ratio = pmouse_x/1200.0
#     ratio = 0.5
#    background ratio*200+40
    background 255
    (0...1200).each {|i|
    	if(ratio > @bwvals[i][1])
    		line(i,0,i,120)
    	end
    }
  end
  
end

Vispectra.new(:width => 1200, :height => 120, :title => "Vispectra")
