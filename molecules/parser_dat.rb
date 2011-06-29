#! /usr/bin/ruby

include Math
require 'narray'
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
#  newname = File.split(filename)[1]
#  newname = File.split(filename)[0]<<"/"<<newname.split(".txt")[0]<<".dat"
#  File.rename(filename, newname)
#  print newname << " \n"
#  } 

output = File.open("data/mod.1400.unrot.spec.total.912.txt", 'w')
Dir.open("data")
Dir.glob("**/*.dat").each {|filename|
  f = File.open(filename, 'r')
  spectlines = []
  total = 0
  f.readlines.each { |line|
    puts(line)
    line = line.split(" ")
    line.map!{|i| i.to_f}
    line[1] = line[1]+1.0
    line[1] = Math.log(line[1])
    output.write("#{line[0].to_s.ljust(8)}  #{line[1].to_s.rjust(12)}\n")
  }
  f.close() 
}
output.close()
