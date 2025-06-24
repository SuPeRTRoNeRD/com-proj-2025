% OFDM modulator
function y = OFDMModulator( u , SamplePerSymbol , NumOfSubcarriers , BitPerSymbol , Rb )
    % Read the following CAREFULLY!
    % Since NumOfSubcarriers = 4, we have 4 subcarrier symbols.
    % SamplePerSymbol should be interpreted as number of samples per subcarrier symbol.
    % BitPerSymbol should be interpreted as number of channel bits per subcarrier symbol.
    % Subcarrier symbol interval = OFDM symbol interval.
    % Rb = input bit rate of overall system
    
    Rs = Rb/BitPerSymbol;               % input symbol rate of overall system
    Rsub = Rs/NumOfSubcarriers;         % subcarrier symbol rate
    SubcarrierSpacing = Rsub;           % subcarrier spacing
    SubcarrierFreqVector = -(NumOfSubcarriers-1)/2*SubcarrierSpacing:SubcarrierSpacing:(NumOfSubcarriers-1)/2*SubcarrierSpacing;
    % frequencies of all subcarriers (note: NumOfSubcarriers = 4)

    Tofdm = 1/Rsub;                                         % OFDM symbol interval
    Fs = SamplePerSymbol*Rsub;                                % sampling frequency
    Ts = 1/Fs;                                              % sampling interval
    Tframe = length(u)/Rs; % the time needed for all bits to be sent
    t = 0:Ts:Tframe-Ts;                                     % time vector
   
    % serial to parallel
    b_parallel=reshape(u,NumOfSubcarriers,length(u)/NumOfSubcarriers);

    % Preallocate
    %b_up=zeros(NumOfSubcarriers,length(t));
    y = zeros(1,length(t));

    for i=1:NumOfSubcarriers
        %Upsample (Rectangular Pulse)
        b_up=repelem(b_parallel(i,:),SamplePerSymbol);
        epower=exp(1i*2*pi*SubcarrierFreqVector(i)*t);
        % Multiply by complex exponential
        b_mod=epower.*b_up;
        % Accumulate the modulated signals for each subcarrier
        y = y + b_mod;
    end

    % To ensure dimension compatibility
    y = y(:).';
end
