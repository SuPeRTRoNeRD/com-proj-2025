% OFDM demodulator
function y = OFDMDemodulator( u , SamplePerSymbol , NumOfSubcarriers , BitPerSymbol , Rb )
    % Read the following CAREFULLY!
    % Since NumOfSubcarriers = 4, we have 4 subcarrier symbols.
    % SamplePerSymbol should be interpreted as number of samples per subcarrier symbol.
    % BitPerSymbol should be interpreted as number of channel bits per subcarrier symbol.
    % Subcarrier symbol interval = OFDM symbol interval.
    % Rb = output bit rate of overall system
    
    Rs = Rb/BitPerSymbol;               % input symbol rate of overall system
    Rsub = Rs/NumOfSubcarriers;         % subcarrier symbol rate
    SubcarrierSpacing = Rsub;           % subcarrier spacing
    SubcarrierFreqVector = -(NumOfSubcarriers-1)/2*SubcarrierSpacing:SubcarrierSpacing:(NumOfSubcarriers-1)/2*SubcarrierSpacing;
    % frequencies of all subcarriers (note: NumOfSubcarriers = 4)

    Tofdm = 1/Rsub;                                         % OFDM symbol interval
    Fs = SamplePerSymbol*Rsub;                                % sampling frequency
    Ts = 1/Fs;                                              % sampling interval
    Tframe = length(u)*Ts; % the time needed for all bits to be sent
    t = 0:Ts:Tframe-Ts;                                     % time vector

    %Preallocate
    sequences=zeros(NumOfSubcarriers,length(u)/SamplePerSymbol);
    mixer=zeros(NumOfSubcarriers,length(u));
 
    for i=1:NumOfSubcarriers
        mixer(i,:)=u.*exp(-1*1i*2*pi*SubcarrierFreqVector(i)*t);
        sequences(i,:)=intdump(mixer(i,:),SamplePerSymbol);
    end 
     
    % Reshape output to one array
    [m,n]=size(sequences);
    y=reshape(sequences,1,m*n);

     % To ensure dimension compatibility
    y = y(:).';
end
