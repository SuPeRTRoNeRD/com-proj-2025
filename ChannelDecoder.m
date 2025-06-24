% Channel decoder
function y = ChannelDecoder( u , n , k , EncType )

    if strcmp( EncType , 'NONE' )
        y = u;
    elseif strcmp( EncType, 'REP')
        sum_of_bits = sum(reshape(u, n, [])); % Sum every n bits
        y = sum_of_bits>(n/2);  % Majority voting
    elseif strcmp( EncType, 'HAM')
        r = n - k; % Number of parity bits
        [H, G] = hammgen(r); % Hamming parity check matrix
        R = reshape(u, n, []); % Received codewords
        S = mod(H * R, 2); % Syndromes, binary encoded
        S_tab = syndtable(H);  % Syndrome table
        S_int = bit2int(S, r); % Convert binary encoded syndromes to ints
        correction_table = S_tab(1+S_int, :)'; % List of all corrections per symbol
        corrected_code = mod(correction_table + R, 2);
        Retrieval_mat = G;  % Hamming generator matrix
        Retrieval_mat(:, 1:r) = 0;  % With parity bits set to zero
        y = reshape(Retrieval_mat * corrected_code, 1, []); % Retrieve original words
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end
