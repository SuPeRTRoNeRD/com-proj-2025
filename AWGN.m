function y = AWGN( u , studentIDs , EbNodB , BitPerSymbol , SamplePerSymbol , NumOfSubcarriers )
    SNRdB = 10 * log10( BitPerSymbol * NumOfSubcarriers / SamplePerSymbol ) + EbNodB;
    y = awgn( u , SNRdB , 'measured' , studentIDs );
    % To ensure dimension compatibility
    y = y(:).';
end