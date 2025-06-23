% Moving average filter (rectangular pulse shaping)
function y = MAF( u , SamplePerSymbol )
    I = filter( ones( 1 , SamplePerSymbol ) / sqrt( SamplePerSymbol ) , 1 , real(u) );
    Q = filter( ones( 1 , SamplePerSymbol ) / sqrt( SamplePerSymbol ) , 1 , imag(u) );
    y = complex( I , Q );
    % To ensure dimension compatibility
    y = y(:).';
end