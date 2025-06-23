% OFDM modulator
function y = OFDMModulator( u , SamplePerSymbol , NumOfSubcarriers , BitPerSymbol , Rb )
    % Read the following CAREFULLY!
	% Since NumOfSubcarriers = 4, we have 4 subcarrier symbols.
	% SamplePerSymbol should be interpreted as number of samples per subcarrier symbol.
    % BitPerSymbol should be interpreted as number of channel bits per subcarrier symbol.
    % Subcarrier symbol interval = OFDM symbol interval.
	% Rb = input bit rate of overall system
    
	% Rs = Insert your code here                        % input symbol rate of overall system
    % Rsub = Insert your code here                      % subcarrier symbol rate
    % SubcarrierSpacing = Insert your code here         % subcarrier spacing
    % SubcarrierFreqVector = Insert your code here      % frequencies of all subcarriers (note: NumOfSubcarriers = 4)

    % Tofdm = Insert your code here                     % OFDM symbol interval
    % Fs = Insert your code here                        % sampling frequency
    % Ts = Insert your code here                        % sampling interval
    % Tframe = Insert your code here                    % the time needed for all bits to be sent
    % t = Insert your code here                         % time vector
       
    % serial to parallel (Insert your code here)
    
    
    % 1st branch for 1st subcarrier (Insert your code here)
    %     For upsampling, use: 
    %     repelem( xxx , SamplePerSymbol );
    %     Fill "xxx" with the sequence of symbols corresponding to the first branch.
    %     Then use the upsampled signal for multplication with complex exponential
    %     to generate the signal of the first branch (first subcarrier)
    
    
    % 2nd branch for 2nd subcarrier (Insert your code here)
    
       
    % 3rd branch for 3rd subcarrier (Insert your code here)
     
    
    % 4th branch for 4th subcarrier (Insert your code here)
    
    
    % forming output (Insert your code here)
    
    
    % To ensure dimension compatibility
    y = y(:).';
end