
% This function executes a minimum intra-class distance dimension reduction.

function LocMat=GetMemdCorrIndex(Num_imf,NumSub_MCI,NumSub_NC)   
    
   
    VarMeanImf_MCI=VarGroupMeanImf('MCI',NumSub_MCI,Num_imf);
    VarMeanImf_NC=VarGroupMeanImf('NC',NumSub_NC,Num_imf);
    Vartmp=(VarMeanImf_MCI+VarMeanImf_NC)/2;
    
   for m=1:size(Vartmp,1)
        for n=1:size(Vartmp,2)
           [ValMat(m,n), LocMat(m,n)]=min(Vartmp(m,n,:));
        end
      end
    

    
  
    
    
    