subjects = [01]; 

user = getenv('USER');

for subject=subjects

subject = num2str(subject, '%02d');

%%%%%%%%%%

if exist(['/home/wshao//BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-01_bold.nii']) == 0
    display('Run 1 has not been unzipped; unzipping now')
    gunzip(['/home/wshao/BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-01_bold.nii.gz'])
else
    display('Run 1 is already unzipped; doing nothing')
end

if exist(['/home/wshao/BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-02_bold.nii']) == 0
    display('Run 2 has not been unzipped; unzipping now')
    gunzip(['/home/wshao/BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-02_bold.nii.gz'])
else
    display('Run 2 is already unzipped; doing nothing')
end

if exist(['/home/wshao/BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-03_bold.nii']) == 0
    display('Run 3 has not been unzipped; unzipping now')
    gunzip(['/home/wshao/BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-03_bold.nii.gz'])
else
    display('Run 3 is already unzipped; doing nothing')
end

if exist(['/home/wshao/BART_spm/sub-' subject '/anat/sub-' subject '_T1w.nii']) == 0
    display('Anatomical image has not been unzipped; unzipping now')
    gunzip(['/home/wshao/BART_spm/sub-' subject '/anat/sub-' subject '_T1w.nii.gz'])
else
    display('Anatomical image is already unzipped; doing nothing')
end

matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'run1run2run3files';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {['/home/wshao/BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-01_bold.nii']}
                                                                     {['/home/wshao/BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-02_bold.nii']}
                                                                     {['/home/wshao/BART_spm/sub-' subject '/func/sub-' subject '_task-balloonanalogrisktask_run-03_bold.nii']}
                                                                     }';
matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('Named File Selector: run1run2run3files(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1) = cfg_dep('Named File Selector: run1run2run3files(2) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{3}(1) = cfg_dep('Named File Selector: run1run2run3files(3) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
matlabbatch{3}.spm.temporal.st.scans{1}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch{3}.spm.temporal.st.scans{2}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rfiles'));
matlabbatch{3}.spm.temporal.st.scans{3}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rfiles'));
matlabbatch{3}.spm.temporal.st.nslices = 34;
matlabbatch{3}.spm.temporal.st.tr = 2;
matlabbatch{3}.spm.temporal.st.ta = 1.94117647058824;
matlabbatch{3}.spm.temporal.st.so = [1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34];
matlabbatch{3}.spm.temporal.st.refslice = 1;
matlabbatch{3}.spm.temporal.st.prefix = 'a';
matlabbatch{4}.spm.spatial.coreg.estwrite.ref(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch{4}.spm.spatial.coreg.estwrite.source = {['/home/wshao/BART_spm/sub-' subject '/anat/sub-' subject '_T1w.nii,1']};
matlabbatch{4}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
matlabbatch{5}.spm.spatial.preproc.channel.vols(1) = cfg_dep('Coregister: Estimate & Reslice: Coregistered Images', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{5}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{5}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{5}.spm.spatial.preproc.channel.write = [0 1];
matlabbatch{5}.spm.spatial.preproc.tissue(1).tpm = {'/opt/spm12/tpm/TPM.nii,1'};
matlabbatch{5}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{5}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{5}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{5}.spm.spatial.preproc.tissue(2).tpm = {'/opt/spm12/tpm/TPM.nii,2'};
matlabbatch{5}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{5}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{5}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{5}.spm.spatial.preproc.tissue(3).tpm = {'/opt/spm12/tpm/TPM.nii,3'};
matlabbatch{5}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{5}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{5}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{5}.spm.spatial.preproc.tissue(4).tpm = {'/opt/spm12/tpm/TPM.nii,4'};
matlabbatch{5}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{5}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{5}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{5}.spm.spatial.preproc.tissue(5).tpm = {'/opt/spm12/tpm/TPM.nii,5'};
matlabbatch{5}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{5}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{5}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{5}.spm.spatial.preproc.tissue(6).tpm = {'/opt/spm12/tpm/TPM.nii,6'};
matlabbatch{5}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{5}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{5}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{5}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{5}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{5}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{5}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{5}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{5}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{5}.spm.spatial.preproc.warp.write = [0 1];
matlabbatch{6}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 2)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{2}, '.','files'));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(3) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 3)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{3}, '.','files'));
matlabbatch{6}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{6}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{6}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{6}.spm.spatial.normalise.write.woptions.prefix = 'w';
matlabbatch{7}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{7}.spm.spatial.smooth.fwhm = [8 8 8];
matlabbatch{7}.spm.spatial.smooth.dtype = 0;
matlabbatch{7}.spm.spatial.smooth.im = 0;
matlabbatch{7}.spm.spatial.smooth.prefix = 's';
matlabbatch{8}.cfg_basicio.file_dir.file_ops.cfg_file_split.name = 'run1run2run3FileSplit';
matlabbatch{8}.cfg_basicio.file_dir.file_ops.cfg_file_split.files(1) = cfg_dep('Smooth: Smoothed Images', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{8}.cfg_basicio.file_dir.file_ops.cfg_file_split.index = {
                                                                     1
                                                                     2
                                                                     3
                                                                     }';
matlabbatch{9}.spm.stats.fmri_spec.dir = {['/home/wshao/BART_spm/sub-' subject '/1stLevel']};
matlabbatch{9}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{9}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{9}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{9}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('File Set Split: run1run2run3FileSplit (1)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}));
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).name = 'cash';
%%

data_cash_run1 = load(['/home/wshao/BART_spm/sub-' subject '/func/cash_run1.txt']);

matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).onset = data_cash_run1(:,1); 

%%
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).duration = 0.772;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).name = 'explode';
%%
data_explode_run1 = load(['/home/wshao/BART_spm/sub-' subject '/func/explode_run1.txt']);

matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).onset = data_explode_run1(:,1);
%%                                                      
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).duration = 0.772;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(1).multi_reg = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('File Set Split: run1run2run3FileSplit (2)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{2}));
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).name = 'cash';
%%
data_cash_run2 = load(['/home/wshao/BART_spm/sub-' subject '/func/cash_run2.txt']);

matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).onset = data_cash_run2(:,1);
%%                                                     
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).duration = 0.772;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).name = 'explode';
%%
data_explode_run2 = load(['/home/wshao/BART_spm/sub-' subject '/func/explode_run2.txt']);

matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).onset = data_explode_run2(:,1);

%%
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).duration = 0.772;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(2).multi_reg = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).scans(1) = cfg_dep('File Set Split: run1run2run3FileSplit (3)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{3}));
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).name = 'cash';
%%

data_cash_run3 = load(['/home/wshao/BART_spm/sub-' subject '/func/cash_run3.txt']);

matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).onset = data_cash_run3(:,1);
                                                        
%%                                                      
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).duration = 0.772;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).name = 'explode';
%%
data_explode_run3 = load(['/home/wshao/BART_spm/sub-' subject '/func/explode_run3.txt']);

matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).onset = data_explode_run3(:,1);

%%
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).duration = 0.772;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(3).multi_reg = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{9}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{9}.spm.stats.fmri_spec.volt = 1;
matlabbatch{9}.spm.stats.fmri_spec.global = 'None';
matlabbatch{9}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{9}.spm.stats.fmri_spec.mask = {''};
matlabbatch{9}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{10}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{10}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{10}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{11}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{11}.spm.stats.con.consess{1}.tcon.name = 'cash-explode';
matlabbatch{11}.spm.stats.con.consess{1}.tcon.weights = [1 -1];
matlabbatch{11}.spm.stats.con.consess{1}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{2}.tcon.name = 'explode-cash';
matlabbatch{11}.spm.stats.con.consess{2}.tcon.weights = [-1 1];
matlabbatch{11}.spm.stats.con.consess{2}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{3}.tcon.name = 'cash';
matlabbatch{11}.spm.stats.con.consess{3}.tcon.weights = [1 0];
matlabbatch{11}.spm.stats.con.consess{3}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{4}.tcon.name = 'explode';
matlabbatch{11}.spm.stats.con.consess{4}.tcon.weights = [0 1];
matlabbatch{11}.spm.stats.con.consess{4}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.delete = 0;

spm_jobman('run', matlabbatch);

end
