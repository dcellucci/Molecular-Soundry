#! /usr/bin/ruby

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

output = File.open("atomic.sc", 'w')
output.write("(")
Dir.open("data")
Dir.glob("**/*.dat").each {|filename|
  f = File.open(filename, 'r')
  spectlines = []
  total = 0
  f.readlines.each { |line|
    line = line.split(" ")
    line.map!{|i| i.to_f}
    line[0] = 1.0/line[0]*2997924.58
    total = total + line[1]
    spectlines << line
  }
  puts spectlines.length
  f.close()
  temp = "///////////////////////////////////////////////////"
  form = "#{temp}\n//#{filename}\n#{temp}\n"
  #form = form << "SynthDef.new(\"#{File.split(filename)[1].split(".dat")[0]}\",\{"
  #form = form << "Out.ar(0,"
  form = form << "a = ["
  spectlines.each{|i|
    form = form << "#{i[0]}, "
    #form = form << "SinOsc.ar(#{i[0]})*#{3.0/spectlines.length}+"
  }
  form = form[0...-2]
  #form = form << ";)\}).send(s);\n\n"
  form = form << "];\n"
  
  form = form << "b = ["
  spectlines.each{|i|
    form = form << "#{(i[1]/total).to_s[0...8]}, "
  }
  form = form[0...-2]
  form = form << "];\n"
  #puts form 
  output.write(form)
}
output.write(")")
output.close()
