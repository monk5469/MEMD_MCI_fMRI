% This file execute a Min intra- and max inter-class distance dimension reduction 
%  for the IMF correlation matrix decomposed by MEMD.
%
% Written by Lingxu Kong and Haifeng Wu, Yunnan Minzu University. 
% 
% Reference:
% Haifeng Wu; Lingxu Kong; Yu Zeng; Han Bao; "Resting-state Brain 
% Connectivity via Multivariate EMD in Mild Cognitive Impairment", 
% IEEE Transactions on Cognitive and Developmental Systems, 2021.

close all
clear all

ROI_timepoint=130;
 N_imf=5; 
 NumSub_MCI=[1:19];
 NumSub_NC=[1:23];

for ind = 1 : size(NumSub_MCI,1)  
  
  %%% Get the index  of IMF No.,%%%
  %%% via the  minimum-intra-class-distance criterion. %%%%%%%%%%%
  LocMat=GetMemdCorrIndex(N_imf,NumSub_MCI(ind,:),NumSub_NC(ind,:));
  %%%%%%%%%%%%%%%%% end %%%%%%%%%%%%%%%%%%%%

  %%% 1. Obtain the dimention redcetion matrix in a MCI Group %%%%%%%%%%
  for nSub=1:length(NumSub_MCI(ind,:))
      % Load the MEMD decomposition Pearson Matrix  
      load(['MEMD_data\MCI\imf_MCI_' ,num2str(NumSub_MCI(ind,nSub)), '.mat']);
        imf_tmp=imf_MCI;
        if size(imf_tmp,1)>=N_imf            imf = imf_tmp(1:N_imf,:,:);
        else                                 imf = imf_tmp;
        end
        RHO = [];
        for n = 1:size(imf,1) 
            imf_n = squeeze(imf(n,:,:)); 
            imf_n = imf_n';
            RHO = cat(3,RHO,corr(imf_n)); % Compute the correlation of imf
        end
        RHO_index=[];
        for m=1:size(RHO,1)
            for n=1:size(RHO,2)
                %%%%% Get the matrix from index computed above %%%%
                RHO_index(m,n)=RHO(m,n,LocMat(m,n));
            end
        end
        MCI_mima(:,:,nSub)=RHO_index;
  end
  
 

    %%%%%%%% 2. Obtain the dimention redcetion matrix in a NC Group %%%%%%%%%    
    for nSub=1:length(NumSub_NC(ind,:))
       % Load the MEMD decomposition Pearson Matrix
        load(['MEMD_data\NC\imf_NC_' ,num2str(NumSub_NC(ind,nSub)), '.mat']);
        imf_tmp=imf_NC;
        if size(imf_tmp,1)>=N_imf            imf = imf_tmp(1:N_imf,:,:); 
        else                                 imf = imf_tmp;
        end
        RHO = [];
        for n = 1:size(imf,1) 
            imf_n = squeeze(imf(n,:,:)); 
            imf_n = imf_n';
            RHO = cat(3,RHO,corr(imf_n));
        end
        RHO_index=[];
        for m=1:size(RHO,1)
            for n=1:size(RHO,2)
                RHO_index(m,n)=RHO(m,n,LocMat(m,n));
            end
        end
        NC_mima(:,:,nSub)=RHO_index;
    end      
end

 %%%% FDR correction
MCI_mima_addfar=corr_add_fdr(mean(MCI_mima,3),getFDR(CmpPValPearson(mean(MCI_mima,3),ROI_timepoint)));
NC_mima_addfar=corr_add_fdr(mean(NC_mima,3),getFDR(CmpPValPearson(mean(NC_mima,3),ROI_timepoint)));
save('NCgroup_IFC_mima','NC_mima_addfar');
save('MCIgroup_IFC_mima','MCI_mima_addfar');