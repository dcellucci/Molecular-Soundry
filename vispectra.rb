# Vispectra

include Math
class Vispectra < Processing::App

  def setup
    f = File.open("molecules/data/rp5.1400.unrot.spec.total.912.txt")
    @bwvals = []
    f.readlines.each {|line|
    	line = line.split(" ")
    	line.map!{|i| i.to_f}
    	line[1] = Math.log(line[1]+1)
    	@bwvals << line
    }
    background 0
    stroke(0,0,0,255)  
  end
  
  def draw
#    ratio = Math.log(pmouse_x+1)/Math.log(601.0)
    ratio = pmouse_x/600.0
#    background ratio*200+40
    background 255
    (0...600).each {|i|
    	if(Math.log(ratio+1) > @bwvals[i][1])
    		line(i,0,i,120)
    	end
    }
  end
  
end

Vispectra.new(:width => 600, :height => 120, :title => "Vispectra")
