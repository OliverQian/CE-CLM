clear
% define the root name of database
root = '../data_preparation/prepared_data/';


% which scales we're doing
sigma = 1;
num_samples = 10e6;

scales = [0.25,0.35,0.5,1.0];
frontalView = 1;

profileViewInds = [2,3,4];

version = 'general';
ratio_neg = 10;
norm = 1;

data_loc = 'combined_';
rng(0);

similarities = {[1,2]; [3, 4]};
sparsity = 1;
sparsity_types = [4,6];

lambda_a = 200;
lambda_b = 7500;
lambda_th = 1;
num_layers = 7;

% whether to save generated patches for external training
% (e.g. for training CEN patches)
save_patches = false;
patches_loc = '../../../../patches/';
patches_loc = '/media/bighdd4/YaoChong/patches/';

for s=scales

    Train_all_patch_experts(root, frontalView, profileViewInds,...
        s, sigma, version, 'ratio_neg', ratio_neg,...
        'num_samples', num_samples, 'data_loc', data_loc,...
        'normalisation_size', 19, 'similarity_types', similarities, 'sparsity', sparsity,...
        'sparsity_types', sparsity_types, 'lambda_a', lambda_a, 'lambda_b', lambda_b, 'lambda_th', lambda_th, 'num_layers', num_layers,...
        'patches_loc', patches_loc, 'save_patches', save_patches);
end
