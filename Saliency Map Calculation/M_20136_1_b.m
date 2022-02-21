clc;
clear;
% Segmented_image has been processed with k means to 85 reduce colors
mySegmentedImage = imread('Segmented_image.jpeg');
mySegmentedImage = mySegmentedImage(:,:,1); % we just need segment labels
segmented_map = unique(mySegmentedImage);
myImage = imread('leaf.png');
[quantized_image, label_matrix] = kmeans_seg_k(myImage,85);
no_regions = length(unique(mySegmentedImage));
saliency_values = zeros(1,no_regions);
for i=1:no_regions
    disp(i)
    for j=1:no_regions
        if j ~= i
            w = sum(sum(mySegmentedImage == segmented_map(j)));
            region_i = slice3dmatrix(quantized_image,mySegmentedImage == segmented_map(i));
            label_matrix_i = label_matrix(mySegmentedImage == segmented_map(i));
            region_j = slice3dmatrix(quantized_image,mySegmentedImage == segmented_map(j));
            label_matrix_j = label_matrix(mySegmentedImage == segmented_map(j));
            value = myDistance(region_i, region_j, label_matrix_i, label_matrix_j);
            saliency_values(i) = saliency_values(i) + w*value;
        end
    end
end

%% forming a salient map
saliency_values = saliency_values/max(saliency_values);
my_saliency_map = mySegmentedImage;
for i=1:no_regions
    my_saliency_map(my_saliency_map == i) = saliency_values(i);
end