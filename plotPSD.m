function plotPSD(s, fs)
% Plotting PSD by Welch method
    L = length(s);
    df = fs/L; f = -fs/2:df:fs/2-df;
    [pxx,f] = pwelch(s,[], 100, f, fs);
    semilogy(f*1e-3,pxx); grid on;
    xlabel('frequncey [kHz]')
end