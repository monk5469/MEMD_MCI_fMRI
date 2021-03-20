%This file obtains a correlation matrix from a NC group, through a wavelt
%transform and clustering. 
% The details can be seen in referece [1]. 
% Written by lingxu Kong, Yunnan Minzu University

% [1] Robyn L Miller, Maziar Yaesoubi, Vince D Calhoun, 
% Cross-Frequency rs-fMRI Network Connectivity Patterns Manifest Differently 
% for Schizophrenia Patients and Healthy Controls, IEEE Signal Process Letters, 2016.

clear all;
close all;

T=130;  % the length of TR time
ROI_n=116; % the number of ROIs
N=23; % the number of NC subjects

pp=zeros(ROI_n,ROI_n,T);
p_tril=zeros(ROI_n,ROI_n);
ff=zeros(ROI_n,ROI_n,T);
f_tril=zeros(ROI_n,ROI_n);
NC_p=zeros(ROI_n,ROI_n,T,N);
NC_f=zeros(ROI_n,ROI_n,T,N);%initialization

for n=1:N
    
    load(['ROI_data\NC\NC_',num2str(n),'.mat']);
    
    for roinum=1:ROI_n
        sub(:,:,roinum)=cwt(ROISignals(:,roinum)',[10:39],'cmor1-1');%Ð¡²¨±ä»»
        j(:,:,roinum)=angle(sub(:,:,roinum));
        p(:,:,roinum)=abs(sub(:,:,roinum));
        max_p=max(p(:,:,roinum));
        p(:,:,roinum)=p(:,:,roinum)./max_p;
    end
    for t=1:T
        for ROInum=1:ROI_n-1
            for ROInum2=ROInum+1:ROI_n
                    a_p=p(:,t,ROInum); b_p=p(:,t,ROInum2);
                    a_j=j(:,t,ROInum);b_j=j(:,t,ROInum2);
                    for y=1:30
                        for yy=1:30
                            A(y,yy)=(a_p(y)+b_p(yy))*0.5*cos(abs(a_j(y)-b_j(yy)));
                        end
                        A_max=max(max(A));%
                        [v,w]=find(A_max==A);
                    end
                    p_tril(ROInum,ROInum2)=(a_p(v)+b_p(w))*0.5;
                    f_tril(ROInum,ROInum2)=abs(v-w);
           end
        end
              
             pp(:,:,t)=p_tril+p_tril'+eye(ROI_n);
             ff(:,:,t)=f_tril+f_tril'+eye(ROI_n);
    end 
    NC_p(:,:,:,n)=pp;
    NC_f(:,:,:,n)=ff;
end
%%% Standardization and FDR
NC_WP_addfar=corr_add_fdr(Standardization(mean(mean(NC_p,4),3)),getFDR(CmpPValPearson(Standardization(mean(mean(NC_p,4),3)),T)));
NC_WF_addfar=corr_add_fdr(Standardization(mean(mean(NC_f,4),3)),getFDR(CmpPValPearson(Standardization(mean(mean(NC_f,4),3)),T)));
save('NCgroup_WP','NC_WP_addfar');
save('NCgroup_WF','NC_WF_addfar');




