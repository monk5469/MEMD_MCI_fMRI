
% This is a demo, which is the first step for the Noise-assisted MEMD[1],
% i.e. adding noise channels.

% Next, the the adding-noise signals  will be performed through the
% noise-assisted MEMD. The algorithm can be refered to the python software,
% whose address is https://github.com/mariogrune/MEMD-Python-.

% [1] Ur Rehman, N., & Mandic, D. e., ¡°Filter Bank eroperty of Multivariate 
% Empirical Mode Decomposition,¡± IEEE Transactions on Signal erocessing, 
% vol. 59, no. 5, pp. 2421¨C2426, May. 2011.

% Written by Lingxu Kong, Yunnan Minzu University.

clear all;
close all;
channel_num=40;
mkdir(['.\',num2str(channel_num),'_channel']);
mkdir(['.\',num2str(channel_num),'_channel\MCI']);
mkdir(['.\',num2str(channel_num),'_channel\NC']);

%%%% 1. For an MCI group %%%%%
for n=1:19
    channel=channel_num;
    fname1=['ROI_data\MCI\MCI_',num2str(n),'.mat'];
    load(fname1)
    y = wgn(130,channel,0);
    ROISignals=[ROISignals y];
    fname2=[num2str(channel),'_channel\MCI\MCI_',num2str(n),'.mat'];
    save(fname2,'ROISignals');
end

%%%% 2. For an NC group %%%%%
for n=1:23
    channel=channel_num;
    fname1=['ROI_data\NC\NC_',num2str(n),'.mat'];
    load(fname1)
    y = wgn(130,channel,0);
    ROISignals=[ROISignals y];
    fname2=[num2str(channel),'_channel\NC\NC_',num2str(n),'.mat'];
    save(fname2,'ROISignals');
end


