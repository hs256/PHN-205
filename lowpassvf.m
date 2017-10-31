N = 100;          % filter order
Fp = 20e3;        % 20 khz passband-edge frequency
Fs = 96e3;        % 96 khz sampling frequency
Rp = 0.00057565;  % Corresponds to 0.01 dB peak
Rst = 1e-4;
eqnum = firceqrip(N, Fp/(Fs/2), [Rp Rst], 'passedge')
fvtool(eqnum, 'Fs', Fs, 'Color', 'White')
Fp2 = 30e3;       % Change passband frequency from 20000 to 30000
eqNum2 = firceqrip(N,Fp2/(Fs/2),[Rp Rst],'passedge');
fvt = fvtool(eqnum,1,eqNum2,1,'Fs',Fs,'Color','White');
legend(fvt,'FIR filter; Passband Frequency = 20000','FIR filter. Passband Frequency = 30000')
Fp3 = 10e3;       % Change passband frequency from 20000 to 10000
eqNum3 = firceqrip(N, Fp3/(Fs/2),[Rp Rst],'passedge');
fvt = fvtool(eqnum,1,eqNum2,1,eqNum3,1,'Fs',Fs,'Color','White');
legend(fvt,'FIR filter; Passband frequency = 20000','FIR filter. Passband Frequency = 30000',...
    'FIR filter. Pasband Frequency = 10000')