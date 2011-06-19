#! /usr/bin/ruby

#This script reads the spectra files located in the data/ 
#directory and outputs a supercollider file that uses the
#information contained within to generate sounds. Each sp
#ectrum has a wavelength and an intensity associated with
#it.

#Daniel Walton Cellucci - June 2011 - danielwcellucci.com


Dir.open("data")
Dir.glob("**/*.txt").each {|filename|
  newname = File.split(filename)[1]
  newname = File.split(filename)[0]<<"/"<<newname.split(".txt")[0]<<".dat"
  File.rename(filename, newname)
  print newname << " \n"
  } 