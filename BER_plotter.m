%% Initialise
% !!! Make sure Combination?.m does not have Initialization included
% n = 5;
Initialization;
clear EbNodB;
%% Get range of EbNodB
EbNodB_list = linspace(0, 18, 20);
BERresults = zeros(1, length(EbNodB_list));

for iteration = 1:length(BERresults)
    EbNodB = EbNodB_list(iteration);
    CombinationB;
    BERresults(iteration) = BER * CR;
end

semilogy(EbNodB_list, BERresults, '.', DisplayName=("n= " + n));
hold on;
