FIRPAR_VS 0.1

% DDFplan 1.1 - assuming 15.0 MHz A/D
% 17-Feb-2000
% L,N=   1,1
% F_CLK > 1.83333 x CLK_IN

% HDF pole1: 15000000.000 Hz
% FIR pole1: 15000000.000 Hz
H_STAGES 1
H_GROWTH 49

H_DRATE  0      % ==> HDF bypassed
H_BYP    0
F_CLA    0

F_TAPS   0
F_ESYM   1
F_DRATE  5
F_BYP    0
F_0AD    0

TAP 0 0x7FFFF  % 1.0000
