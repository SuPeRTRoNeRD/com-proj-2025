% Channel encoder
function y = ChannelEncoder( u , k , n , EncType )

    if strcmp( EncType , 'NONE' )
        y = u;
        
    %elseif ?
        % Insert you code here
        
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end