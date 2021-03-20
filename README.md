# MEMD_MCI_fMRI
This software is for the paper [1], whose abstract is as follows. 

Mild cognitive impairment (MCI) is regarded as a brain disconnection syndrome. The functional connectivity from resting state functional magnetic resonance imaging (rs-fMRI) shows that the number and the strength of the connectivity in MCI will decrease. However, many studies have confirmed that, the decrease and increase in MCI actually coexist. This paper proposes a novel intrinsic-frequency connectivity to study the statistical significance between MCI and normal control (NC), especially stronger positive connectivity on an MCI group mean level. We use a multivariate empirical model decomposition to get intrinsic modal functions (IMFs) and calculate the correlations of the IMFs. In experiments, we use public data to test the proposed coefficient. When some dimension-reduction criteria are adopted, we can find some stronger intrinsic frequency correlation in MCI, which cannot be observed in traditional correlations. After further searched, the stronger connectivity is mainly distributed in the regions of MCI functional compensation and abnormal neuron recruitment hypothesis. From an intrinsic frequency spectrum, the reason for MCI's stronger positive intrinsic frequency correlation is that NC's correlation becomes smaller. One of explanations is that, the common respiration and cardiac noises in the intrinsic frequency correlation are removed, so that the positive correlation is weakened.

This folder includes eight sub-folders. 

1. /data

  1.1 /data/ROI_data

  This data is obtained by the following steps. 

  (1) Download NC data and MCI data from ADNI database, website: http://adni.loni.usc.edu/
  (2) Using AAL template to extract the ROI data of each subject, where the number of ROI is 116. The Details can be found in reference [1]. 

  1.2 /data/MEMD_data

  This data is obtained by the following steps:

  (1) Download NC data and MCI data from ADNI database, website: http://adni.loni.usc.edu/
  (2) Using AAL template to extract the ROI data of each subject, where the number of ROI is 116. The Details can be found in reference [1]. 
  (3) Each data is decomposed by MEMD to get the IMF component of each ROI. MEMD is written in Python language. The download address of the MEMD software package is https://github.com/mariogrune/MEMD-Python-

2. /IFC_Dimension reduction

This folder contains three sub folders max, min, mima, which respectively reduce the dimension of the maximum inter class, minimum intra class distance and maximum minimum criterion for Pearson correlation matrix of IMF after MEMD decomposition.

2.1 / IFC_Dimension reduction /max

Run the main file IFC_max.m, which executes a maximum-inter-class-distance dimension reduction for the IMF correlation matrix decomposed by MEMD. 

2.2 / IFC_Dimension reduction /min

Run the main file IFC_min.m, which executes a minimum-intra-class-distance dimension reduction for the IMF correlation matrix decomposed by MEMD.

2.3 / IFC_Dimension reduction /mima

Run the main file IFC_mima.m, which executes a min intra- and max inter-class distance dimension reduction for the IMF correlation matrix decomposed by MEMD.

3. /wavelet

(1) Run the file cmorlet_MCI.m and will obtain a correlation matrix from a MCI group, through a wavelt transform and clustering. The details can be seen in reference [2]. 

(2) Run the file cmorlet_NC.m and will obtain a correlation matrix from a NC group, through a wavelt transform and clustering. The details can be seen in reference [2]. 

4. /Group_plotImage

Run the file plotimage.m and will plot Pearson correlation matrix on a MCI and a NC group mean level,  where MCI_Pearson.mat and NC_Pearson.mat is computed from, ROI data in directory  'data\ROI_data' and performing Pearson correlation. 

5. /Group_plotImage

(1) Run the file fig_7.m and will plot histograms of the number of the intrinsic frequency connectivity on group means: MCI-NC >delta & NC > 0, where delta = from 0.3 to 0.4.

(2) Run the file fig8_11a_12a.m and will plot fig 8, 11a and 12a in [1].

(3) The file fig12b_R.txt is edited by R language, and is for fig. 12b.

(4) The folder /brainnet is for BrainNet viewer.

6. \fig9

Run the file fig_9.m and will plot fig 9 in [1].

7. /fig10

Run the file plotimage.m and will plot fig 10 in [1].

8. /fig13_addnoise

8.1 /fig13_addnoise /add_noise

The file add_noise.m is a demo, which is the first step for the Noise-assisted MEMD[3], i.e. adding noise channels. Next, the adding-noise signals will be performed through the noise-assisted MEMD. The algorithm can be referred to the python software, whose address is https://github.com/mariogrune/MEMD-Python-.

8.2 /fig13_addnoise /fig

The file find_MCI_NC_Q.m is a demo, which plots fig. 13 in [1]. Here, the demo gives the case of delta=0.25. The data loading A_B_XXX.mat is decomposed by noise-assisted MEMD [3], where 
   A   is the number of channels, 
   B   is the number of IMFs,
   XXX is
     MC when a MC group(mean), 
     NC when a NC group(mean),
     MCIminusNC when MCI(mean)-NC(mean),
respectively. The first step for the data A_B_XXX.mat, adding noise can be seen in add_noise.m in this directory. The second step, MEMD algorithm can be referred to the python software, whose address is https://github.com/mariogrune/MEMD-Python-.

9. Reference

[1] Haifeng Wu; Lingxu Kong; Yu Zeng; Han Bao; "Resting-state Brain Connectivity via Multivariate EMD in Mild Cognitive Impairment", IEEE Transactions on Cognitive and Developmental Systems, 2021.

[2] Robyn L Miller, Maziar Yaesoubi, Vince D Calhoun, % Cross-Frequency rs-fMRI Network Connectivity Patterns Manifest Differently for Schizophrenia Patients and Healthy Controls, IEEE Signal Process Letters, 2016.

[3] Ur Rehman, N., & Mandic, D. e., “Filter Bank eroperty of Multivariate Empirical Mode Decomposition,” IEEE Transactions on Signal processing, vol. 59, no. 5, pp. 2421–2426, May. 2011.
