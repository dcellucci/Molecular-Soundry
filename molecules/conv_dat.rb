#! /usr/bin/ruby

include Math

#This script reads the spectra files located in the data/ 
#directory and outputs a supercollider file that uses the
#information contained within to generate sounds. Each sp
#ectrum has a wavelength and an intensity associated with
#it.

#Daniel Walton Cellucci - June 2011 - danielwcellucci.com

### CODE DESIGNED TO RECURSIVELY READ DIRECTORIES AND ###
########### CHANGE THE FILENAMES OF THE DATA ############
#Dir.open("data")
#Dir.glob("**/*.txt").each {|filename|
#newname = File.split(filename)[1]
#newname = File.split(filename)[0]<<"/"<<newname.split(".txt")[0]<<".dat"
#File.rename(filename, newname)
#print newname << " \n"
#} 


Dir.open("data")
Dir.glob("**/*.dat").each {|filename|

	f = File.open(filename, 'r')
	output = File.open("data/conv.1400.unrot.spec.total.912.txt", 'w+')
	output2 = File.open("data/conv2.1400.unrot.spec.total.912.txt", 'w')
	output3 = File.open("data/slopedata.1400.unrot.spec.total.912.txt", 'w')
	g = File.open("data/peaks.1400.unrot.spec.total.912.txt",'w')
	
	spectlines = []
	conv = []
	peak = []
	slope = [0,0]
	peakindex = [0,0] 
	bigval = 0
	peaks = 0
	
	f.readlines.each { |line|
		total = 0
		#puts(line)
		line = line.split(" ")
		line.map!{|i| i.to_f}
		conv.push(line[1])
		if(conv.length > 200)
			total = 0
			conv = conv[1..-1]
			conv.each{ |item| total = total+item/200.0}
			output.write("#{line[0].to_s.ljust(8)} #{total.to_s.rjust(12)}\n")
			if(total > bigval)
				bigval = total
			end
		end 
	}
	f.close() 
	output.close()
	output = File.open("data/conv.1400.unrot.spec.total.912.txt", 'r')
	output.readlines.each { |line|
		line = line.split(" ")
		line.map!{|i| i.to_f}
		output2.write("#{line[0].to_s.ljust(8)} #{(line[1]/bigval).to_s.rjust(12)}\n")
		peakindex.push(line[0])
		peakindex = peakindex[1..-1]
		slope.push(line[1]/bigval)
		slope = slope[1..-1]
		output3.write("#{line[0].to_s.ljust(8)} #{((slope[1]-slope[0])/(peakindex[1]-peakindex[0])).to_s.rjust(12)}\n")
=begin
		peak.push(line[1]/bigval)
		if(peak.length > 3)
			peak = peak[1..-1]
			slope1 = (peak[1]-peak[0])/(peakindex[1]-peakindex[0])
			slope2 = (peak[2]-peak[1])/(peakindex[2]-peakindex[1])
			if(slope1*100 > 1 and slope2*100 < -1)
				g.write("#{peakindex[1].to_s.ljust(8)} #{peak[1].to_s.rjust(12)}\n")
				peaks = peaks+1
				puts peaks
			end
		end
=end
	}
	g.close()
	output.close()
}


