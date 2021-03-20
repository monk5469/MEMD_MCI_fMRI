
% This function executes a maximum inter-class distance dimension reduction.

function LocMat=GetMemdCorrIndex(Num_imf,NumSub_MCI,NumSub_NC)
    
    
    CorrMeanImf_MCI=CorrGroupMeanImf('MCI',NumSub_MCI,Num_imf);
    CorrMeanImf_NC=CorrGroupMeanImf('NC',NumSub_NC,Num_imf);
 
    corrtmp=abs(CorrMeanImf_MCI-CorrMeanImf_NC);
    for m=1:size(corrtmp,1)
        for n=1:size(corrtmp,2)
           [ValMat(m,n), LocMat(m,n)]=max(corrtmp(m,n,:));
        end
    end
   
  
    
    
    