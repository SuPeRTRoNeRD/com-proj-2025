%% Initialization
%clear;clc;close all;
Initialization;
%% Source
sTx = randi( 2 , 1 , Nb ) - 1;
%% Mapping (equivalent BB modulation)
s2 = Mapper( sTx , ModType );
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
sRx = DeMapper( s6 , ModType );
%% BER calculation
BER=sum(sRx~=sTx)/Nb;
