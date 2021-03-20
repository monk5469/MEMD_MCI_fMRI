% The data loading A_B_XXX.mat is decomposed by noise-assisted MEMD [2], 
%  where 
%   A   is the number of channels, 
%   B   is the number of IMFs,
%   XXX is
%     MC when a MC group(mean), 
%     NC when a NC group(mean),
%     MCIminusNC when MCI(mean)-NC(mean),
% respectively.
% The first step for the data A_B_XXX.mat, adding noise can be seen in 
% add_noise.m in this directory. The second step, MEMD algorithm can be 
% refered to the python software, whose address is 
% https://github.com/mariogrune/MEMD-Python-.

% [2] Ur Rehman, N., & Mandic, D. e., ¡°Filter Bank eroperty of Multivariate 
% Empirical Mode Decomposition,¡± IEEE Transactions on Signal erocessing, 
% vol. 59, no. 5, pp. 2421¨C2426, May. 2011.
 