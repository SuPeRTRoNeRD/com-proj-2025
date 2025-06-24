%% Initialization
%clear;clc;close all;
Initialization;
%% Source
sTx = randi( 2 , 1 , Nb ) - 1;
%% Channel Encoding
s1 = ChannelEncoder( sTx , k , n , EncType );
%% Mapping (equivalent BB modulation)
s2 = Mapper( s1 , ModType );
%% Upsampling
s3 = ZeroPadder( s2 , SamplePerSymbol );
%% Pulse Shaping
s4 = MAF( s3 , SamplePerSymbol );
%% Phase Offset
s5 = s4;                                                            % No phase offset
%s5 = s4 * exp( 1i * deg2rad(130) );                                 % Phase offset
%% AWGN Channel
s6 = AWGN( s5 , studentIDs , EbNodB , BitPerSymbol , SamplePerSymbol , NumOfSubcarriers );
%% Match Filtering
s7 = MAF( s6 , SamplePerSymbol );
%% Downsampling
s8 = Downsampler( s7 , SamplePerSymbol );
%% De-mapping (equivalent BB demodulation)
s9 = DeMapper( s8 , ModType );
%% Channel Decoding
sRx = ChannelDecoder( s9 , n , k , EncType );
%% BER calculation
BER=sum(sRx~=sTx)/Nb;
