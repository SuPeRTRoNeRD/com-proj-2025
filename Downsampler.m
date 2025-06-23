% Drop N-1 out of N
function y = Downsampler( u , SamplePerSymbol )
    SamplingOffset = SamplePerSymbol - 1;
    y = u( 1 + SamplingOffset : SamplePerSymbol : end );
    % To ensure dimension compatibility
    y = y(:).';
end