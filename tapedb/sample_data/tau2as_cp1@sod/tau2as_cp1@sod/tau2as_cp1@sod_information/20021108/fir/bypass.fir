FIRPAR_VS	0.1
%==========================
% bypass.fir
%
%==========================

H_STAGES	1
H_DRATE		2	% HDF decimation 3

F_TAPS		2	% FIR has 3 symmetric taps
F_ESYM		1
F_DRATE		0	% FIR decimation factor 1
   
%TAP	0	0x70000	% first and last tap = 0
%TAP	1	0x70000 % center tap = 0.5

TAP	0	0x00000	% first and last tap = 0
TAP	1	0x70000 % center tap = 0.5


H_BYP		1
F_BYP		1

