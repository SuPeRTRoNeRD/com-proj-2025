% De-mapper (A.K.A. complex equivalent BB demodulator)
function y = DeMapper( u , ModType )

    if strcmp( ModType , 'BPSK' )
        % Power normalization (always start with power normalization)
        u = u * sqrt(1) / sqrt( mean( abs(u).^2 ) );
        % Threshold detector implementation 
        u( real(u) <= 0 ) = -1;
        u( real(u) >  0 ) = +1;
        % Symbol to bit conversion according to constellation
        y = zeros( 1 , length(u) );
        y( u == -1 ) = 0;
        y( u == +1 ) = 1;
        
    %elseif ?
        % Insert your code here
        
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end
