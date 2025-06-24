% Channel encoder
function y = ChannelEncoder( u , k , n , EncType )

    if strcmp( EncType , 'NONE' )
        y = u;
    elseif strcmp (EncType, 'REP')
        y = repelem(u, n);
    elseif strcmp (EncType, 'HAM')
        r = n - k; % Number of parity bits
        [~, G] = hammgen(r); % Generate Hamming generator matrix G
        u = reshape(u, k, [])'; % Convert u into a vector of words
        y = mod(u * G, 2);  % Encode the words by adding parity bits
        y = reshape(y', 1,  []); % Convert back to array
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end