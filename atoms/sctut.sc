
{ 
        var x = SinOsc.ar(MouseX.kr(1, 100));
        SinOsc.ar(300 * x + 800, 0, 0.1) 
        + 
        PinkNoise.ar(0.1 * x + 0.1) 
}.play;

{a=LocalIn.ar;LocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([4,4.005]),1e3*a.abs)*50), a).distort));x;}.play;//tryingharder_to_noavail

SynthDef(
    "sine",
    {
      arg gate = 1, out = 0,
      freq = 200, amp = 0.4,
      pan = 0, ar = 1, dr = 1;
      
      var audio = SinOsc.ar(freq, 0, amp);
      //audio = audio * Linen.kr(gate, ar, 1, dr, 2);
      //audio = Pan2.ar(audio, pan);
      OffsetOut.ar(out,audio);
    }
).add;
(
var lines = [767.938548001209, 761.2036816981515, 752.4514470873773, 751.9720524236534, 739.3720802330141, 738.8600320394331, 735.6761814549969, 734.4560111518609, 719.7725336726609, 719.3977304086368, 688.8755925559122, 688.4611152064632, 684.3982896461038, 683.7333464092833, 682.8067708440095, 677.0380713640469, 676.1234418661296, 675.7424405329439, 675.7256863363837, 669.0063688866277, 668.9809900185883, 661.1673668865468, 655.8431406007306, 648.7188842966265, 637.4507664273154, 633.8066735306119, 632.5282524437768, 632.5122380905161, 617.9886170146976, 580.1689808856798, 579.5689236527294, 578.346862514734, 569.4918287834262, 569.4745202179938, 560.7811065510908, 555.0129370512855, 544.1274466385944, 542.2760938497687, 524.9303688087563, 518.1960136967595, 518.1736219138683, 506.71174677973033, 506.5636245049137, 474.4512464549782, 474.4122046322026, 474.39343681214785, 472.3566082744843, 472.3402353252581, 457.98018933786744, 452.8286005159779, 452.8197088770302, 452.1190529692361, 442.0772224229332, 441.66040498832473, 440.0390702289494, 439.6254408463076, 434.8031994662722, 430.4023573664112, 424.6105509453417];

var intensity = [0.004305, 0.006458, 0.001076, 0.008611, 0.002152, 0.010764, 0.003229, 0.002152, 0.004305, 0.016146, 0.021528, 0.006458, 0.006458, 0.009687, 0.010764, 0.008611, 0.009687, 0.005382, 0.004305, 0.015069, 0.012917, 0.006458, 0.030139, 0.003229, 0.007534, 0.010764, 0.006458, 0.005382, 0.007534, 0.080731, 0.023681, 0.430570, 0.008611, 0.007534, 0.001076, 0.009687, 0.002152, 0.006458, 0.032292, 0.005382, 0.004305, 0.007534, 0.006458, 0.010764, 0.009687, 0.007534, 0.010764, 0.009687, 0.011840, 0.005382, 0.006458, 0.002152, 0.007534, 0.008611, 0.007534, 0.008611, 0.004305, 0.006458, 0.008611];

( instrument: \default,
  freq:       lines,
  sustain:    10, 
  amp:        intensity
).play
)


{ Linen.kr(Impulse.kr(2), 0.01, 0.6, 1.0, doneAction: 0) * SinOsc.ar(440, 0, 0.1)}.play;