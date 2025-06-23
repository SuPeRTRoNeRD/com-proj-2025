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
    elseif strcmp( EncType, 'HAM')
        % k = uncoded = 4
        % n = coded = 7
        p = n - k; % Number of parity bits
        H = hammgen(p); % Hamming parity check matrix
        R = reshape(u, n, []); % Received codewords
        S = mod(H * R, 2); % Syndromes
        S_tab = syndtable(H);  % Syndrome table
        S_int = bit2int(S, p);
        % C = S * u; % Correction table (binary)
        correction_table = S_tab(1+S_int, :)';
        corrected_code = mod(correction_table + R, 2);
        Retrieval_mat = [
        0 0 0 0;
        0 0 0 0;
        0 0 0 0;
        1 0 0 0;
        0 1 0 0;
        0 0 1 0;
        0 0 0 1]';
        y = reshape(Retrieval_mat * corrected_code, 1, []);
    end
    
    % To ensure dimension compatibility
    y = y(:).';
end
