% Channel encoder
function y = ChannelEncoder( u , k , n , EncType )

    if strcmp( EncType , 'NONE' )
        y = u;
    elseif strcmp (EncType, 'REP')
        y = repelem(u, n);
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end