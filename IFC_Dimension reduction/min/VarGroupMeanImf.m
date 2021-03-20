
% This function returns a variance of a class, i.e. a intra-class distance.

function Var=VarGroupMeanImf(Group,NumSub,N_imf)



%%%%%%%%   %%%%%%%%%%%%%
RHOMean=[];
for nSub=1:length(NumSub)

    
    if strcmp(Group,'MCI')
       load([ 'MEMD_data\MCI\imf_MCI_', num2str(NumSub(nSub)), '.mat']);
       imf_tmp=imf_MCI;
    elseif strcmp(Group,'NC')
       load([ 'MEMD_data\NC\imf_NC_', num2str(NumSub(nSub)), '.mat']);
       imf_tmp=imf_NC;
    end
    
    if size(imf_tmp,1)>=N_imf
        imf = imf_tmp(1:N_imf,:,:);
    else
        imf = imf_tmp;
    end
    % imf = imf_MCI;
    RHO = [];
    for n = 1:size(imf,1) % n is the imf index
        imf_n = squeeze(imf(n,:,:)); % we are choosing all channels corresponding to the n^{th} imf
        imf_n = imf_n';
        RHO = cat(3,RHO,corr(imf_n));
    end
    RHOMean(:,:,:,nSub) = RHO;
end
y=mean(RHOMean,4);

for nSub=1:length(NumSub)
    RHOabs(:,:,:,nSub)=abs(RHOMean(:,:,:,nSub)-y);
end
Var=mean(RHOabs,4);



        


