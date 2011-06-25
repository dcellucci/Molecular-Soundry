//Atomic Chord Generator
//Written by Daniel Cellucci, May 2011
//This takes an array of absorption lines and relative strengths
//and generates a chord using a superposition of oscillators who
//se frequencies and amplitudes are calculated using the arrays.

//So to play a sound choose one of the arrays below
//Hydrogen with variable strengths
a = [[397.0,8.0],[410.2,15.0],[434.0,30.0],[486.1,80.0],[656.3,300.0]];
//Hydrogen with equal strength
a = [[397.0,1.0],[410.2,1.0],[434.0,1.0],[486.1,1.0],[656.3,1.0]];
//Helium with variable strengths
a = [[396.5,20.0],[400.9,1.0],[402.6,55.0],[412.0,14.0],[414.4,3.0],[438.8,10.0],[443.8,3.0],[447.1,200.0],[447.2,25.0],[468.5, 36.0],[471.3,34.0],[492.2,20.0],[501.6,100.0],[504.8,10.0],[541.2,5.0],[587.6,500.0],[587.6,100.0],[656.0,8.0],[667.8,100.0],[686.7,3.0],[706.5,230.0]];
//Full Chord for the Visible Spectrum of Light. 
a = [[390,1.0],[750,1.0]];

//then run this entire group of code right here
(
//Initialization of variables
b = [];c = [];s = 0;
//convert a wavelength to an audible frequency
//full conversion - might start with C4
//a.do({arg wlen, i;a[i][0] = 1.0/a[i][0]*299792.458;s = s+a[i][1]});
//newton chord range (D4 to D5)
//a.do({arg wlen, i;	a[i][0] = (1.0/a[i][0]*299792.458-400)*294/369+293;s = s+a[i][1]});
//create the array of oscillators each with the
//assigned frequency and amplitude
a.do({arg wlen, i; b = b++[{SinOsc.ar(a[i][0])*a[i][1]/s}]});
b.do({arg osci, i; c = c++[b[i].play]});
)

//to stop playback just run this command
c.do({arg osci, i; c[i].free})

