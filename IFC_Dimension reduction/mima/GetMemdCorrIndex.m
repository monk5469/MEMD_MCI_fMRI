
% This function executes a Min intra- and max inter-class distance dimension reduction.

function LocMat=GetMemdCorrIndex(Num_imf,NumSub_MCI,NumSub_NC)   
        

    CorrMeanImf_MCI=CorrGroupMeanImf('MCI',NumSub_MCI,Num_imf);
    CorrMeanImf_NC=CorrGroupMeanImf('NC',NumSub_NC,Num_imf);
    corrtmp=abs(CorrMeanImf_MCI-CorrMeanImf_NC);

    VarMeanImf_MCI=VarGroupMeanImf('MCI',NumSub_MCI,Num_imf);
    VarMeanImf_NC=VarGroupMeanImf('NC',NumSub_NC,Num_imf);
    Vartmp=(VarMeanImf_MCI+VarMeanImf_NC)/2;

    for i=1:Num_imf
        for m=1:size(corrtmp,1)
            for n=1:size(Vartmp,2)
                Vartmp(m,n,i)= corrtmp(m,n,i)/Vartmp(m,n,i);
            end
        end
    end  

    for m=1:size(Vartmp,1)
        for n=1:size(Vartmp,2)
           [ValMat(m,n), LocMat(m,n)]=max(Vartmp(m,n,:));
        end
    end
%     

    
  
    
    
    