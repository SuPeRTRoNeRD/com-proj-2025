% Zero padder
function y = ZeroPadder( u , SamplePerSymbol )
    Mat = complex( zeros( SamplePerSymbol , length(u) ) , zeros( SamplePerSymbol , length(u) ) );
    Mat(1,:) = u(:).';
    y = reshape( Mat , 1 , length(u) * SamplePerSymbol );
    % To ensure dimension compatibility
    y = y(:).';
end