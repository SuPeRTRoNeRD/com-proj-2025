% Script to run a combination file multiple times for different values of
% EbNodB, and getting a plot out of it
%% Initialise
% !!! Make sure Combination?.m does not have Initialization included
Initialization;
clear EbNodB;
%% Get range of EbNodB to loop over
EbNodB_list = linspace(0, 18, 20);
BERresults = zeros(1, length(EbNodB_list));

for iteration = 1:length(BERresults)
    EbNodB = EbNodB_list(iteration);
    CombinationC;
    BERresults(iteration) = BER * CR; % Compensation factor for channel coding
end

semilogy(EbNodB_list, BERresults, '.', DisplayName=("n= " + n));
% DisplayName is what will be displayed on the legend for each iteration,
% enable the legend simply using 'legend'
hold on;
