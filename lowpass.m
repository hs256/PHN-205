N = 100;          % filter order
Fp = 20e3;        % 20 khz passband-edge frequency
Fs = 96e3;        % 96 khz sampling frequency
Rp = 0.00057565;  % Corresponds to 0.01 dB peak
Rst = 1e-4;
eqnum = firceqrip(N, Fp/(Fs/2), [Rp Rst], 'passedge')
fvtool(eqnum, 'Fs', Fs, 'Color', 'White')
N2 = 200; % Change filter order from 100 to 200
eqNum200 = firceqrip(N2,Fp/(Fs/2),[Rp Rst],'passedge');
fvt = fvtool(eqnum,1,eqNum200,1,'Fs',Fs,'Color','White');
legend(fvt,'FIR filter; Order = 100','FIR filter. Order = 200')
Fst = 23e3;  % Transition Width = Fst - Fp
numMinOrder = firgr('minorder',[0,Fp/(Fs/2),Fst/(Fs/2),1],[1 1 0 0],...
    [Rp Rst]);
fvt = fvtool(eqnum,1,eqNum200,1,numMinOrder,1,'Fs',Fs,'Color','White');
legend(fvt,'FIR filter; Order = 100','FIR filter. Order = 200',...
    'FIR filter. Order = 133')