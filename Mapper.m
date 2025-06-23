% Mapper (A.K.A. complex equivalent BB modulator)
function y = Mapper( u , ModType )

    if strcmp( ModType , 'BPSK' )
        map = [complex( -1 , eps ) complex( +1 , eps )];
        y = complex( zeros( 1 , length(u) ) , zeros( 1 , length(u) ) );
        y(u==0) = map(1);
        y(u==1) = map(2);
        
    %elseif ?
        % Insert your code here
        
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end
