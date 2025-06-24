%% Save this code before running Combination?.m
% SamplePerSymbol, NumOfSubcarriers and BitPerSymbol should be all in the form of 2^m, where m is a positive integer

%%%%%%%%%%%% AWGN Channel
EbNodB = 4.32*1; % SNR per channel bit in dB

%%%%%%%%%%%% Upsampling and Pulse Shaping | OFDM Modulation
SamplePerSymbol = 32; % Number of samples per symbol of the pulse shaping filter > 4
NumOfSubcarriers = 4; % Number of OFDM subcarriers = 4 if OFDM is used. Otherwise, it should be set to 1

%%%%%%%%%%%% Mapping (A.K.A. equivalent complex BB modulation)
ModType = 'BPSK'; % Make sure you choose the correct corresponding BitPerSymbol in the next line
BitPerSymbol = 1; % Number of channel bits per channel symbol

%%%%%%%%%%%% Channel coding
EncType = 'HAM'; % Channel coding type. Make sure you choose the correct corresponding k and n in the next two lines
k = 4; % Uncoded word length in information bits
n = 7; % Coded word length in channel bits
CR = k / n; % Coding rate of the channel coding

%%%%%%%%%%%% Source
% x1 = randi(10,1,1); % Use last digit in s-number of 1st student instead
% x2 = randi(10,1,1); % Use last digit in s-number of 2nd student instead
% x3 = randi(10,1,1); % Use last digit in s-number of 3rd student instead
% x4 = randi(10,1,1); % Use last digit in s-number of 4th student instead
x1 = 4; % Veerle
x2 = 0; % Rolf
x3 = 2; % Pieter
x4 = 3; % Berend

studentIDs = 1 * x1 + 2 * x2 + 3 * x3 + 4 * x4;
Nb = NumOfSubcarriers * BitPerSymbol * k * 100000; % Number of information bits to be simulated (i.e., transmitted)
rng( studentIDs , 'twister' );
Rb_inf = 1e6;       % information bit rate in bps <-- this is what the end user cares about
Rb = Rb_inf / CR;   % channel bit rate in bps