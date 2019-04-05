FIRPAR_VS 0.1

% DDFplan 1.1 - assuming 15.0 MHz A/D
% 06-Aug-2002
% L,N=   1,2
% F_CLK > 0.75 x CLK_IN
% ddfplan15(3,5,4,1,2)
% HDF pole1: 5000000.000 Hz
% FIR pole1: 2500000.000 Hz
H_STAGES 5
H_GROWTH 42

H_DRATE  2
H_BYP    0
F_CLA    0

F_TAPS   1
F_ESYM   1
F_DRATE  3
F_BYP    0
F_0AD    0

TAP 0 0x436C8  % 0.5267
