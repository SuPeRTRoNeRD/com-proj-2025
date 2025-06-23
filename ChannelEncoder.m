% Channel encoder
function y = ChannelEncoder( u , k , n , EncType )

    if strcmp( EncType , 'NONE' )
        y = u;
    elseif strcmp (EncType, 'REP')
        y = repelem(u, n);
    elseif strcmp (EncType, 'HAM')
        % Generate parity-check matrix H and Hamming generator matrix G
        % k = uncoded = 4
        % n = coded = 7
        p = n - k; % Number of parity bits
        [~, G] = hammgen(p);
        u = reshape(u, k, [])';
        y = u * G;
        y = reshape(y', 1,  []);
        y = mod(y, 2);
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end