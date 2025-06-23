%% Initialization
%clear;clc;close all;
Initialization;
%% Source
sTx = randi( 2 , 1 , Nb ) - 1;
%% Channel Encoding
s1 = ChannelEncoder( sTx , k , n , EncType );
%% Mapping (equivalent BB modulation)
s2 = Mapper( s1 , ModType );
%% OFDM Modulation
s3 = OFDMModulator( s2 , SamplePerSymbol , NumOfSubcarriers , BitPerSymbol , Rb );
%% Phase Offset
s4 = s3;                                                            % No phase offset
%s4 = s3 * exp( 1i * deg2rad(130) );                                 % Phase offset
%% AWGN Channel
s5 = AWGN( s4 , studentIDs , EbNodB , BitPerSymbol , SamplePerSymbol , NumOfSubcarriers );
%% OFDM Demodulation
s6 = OFDMDemodulator( s5 , SamplePerSymbol , NumOfSubcarriers , BitPerSymbol , Rb );
%% De-mapping (equivalent BB demodulation)
s7 = DeMapper( s6 , ModType );
%% Channel Decoding
sRx = ChannelDecoder( s7 , n , k , EncType );
%% BER calculation
BER=sum(sRx~=sTx)/Nb