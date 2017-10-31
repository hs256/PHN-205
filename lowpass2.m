N = 100;          % filter order
Fp = 20e3;        % 20 khz passband-edge frequency
Fs = 96e3;        % 96 khz sampling frequency
Rp = 0.00057565;  % Corresponds to 0.01 dB peak
Rst = 1e-4;
eqnum = firceqrip(N, Fp/(Fs/2), [Rp Rst], 'passedge')
fvtool(eqnum, 'Fs', Fs, 'Color', 'White')
Rst2 = 2e-4; % Change peak from 0.01 dB to 0.02 dB
eqNum200 = firceqrip(N,Fp/(Fs/2),[Rp Rst2],'passedge');
fvt = fvtool(eqnum,1,eqNum200,1,'Fs',Fs,'Color','White');
legend(fvt,'FIR filter; Peak = 0.01 dB','FIR filter. Peak = 0.02 dB')
Rst3 = 3e-4  % Change peak from 0.01 dB to 0.03 dB
eqnum3 = firceqrip(N,Fp/(Fs/2),[Rp Rst3],'passedge');
fvt = fvtool(eqnum,1,eqNum200,1,eqnum3,1,'Fs',Fs,'Color','White');
legend(fvt,'FIR filter; Peak = 0.01 dB','FIR filter. Peak = 0.02 dB',...
    'FIR filter. Peak = 0.03 dB')