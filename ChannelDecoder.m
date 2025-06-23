% Channel decoder
function y = ChannelDecoder( u , n , k , EncType )

    if strcmp( EncType , 'NONE' )
        y = u;
    elseif strcmp( EncType, 'REP')
        sum_of_bits = zeros(1, length(u)/n);
        for index = 1:n
            sum_of_bits = sum_of_bits + u(index:n:end);
        end
        y = sum_of_bits>(n/2);
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end
