% Channel decoder
function y = ChannelDecoder( u , n , k , EncType )

    if strcmp( EncType , 'NONE' )
        y = u;
        
    %elseif ?
        % Insert your code here
        
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end
