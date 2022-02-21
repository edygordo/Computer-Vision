clear;
clc;
my_image = imread('leaf.png');
[quantized_image, label_matrix] = kmeans_seg_k(my_image, 85);
Saliency_Values = zeros(1,85);
% Equation 3 has been utilized here , n = 85(distinct pixel colors)
sum_prob = 0;
for i=1:85 % Complexity is O(n2) 
    for j=1:85
        Saliency_Values(i) = Saliency_Values(i) + findProb(j,label_matrix)*Distance(i,j,label_matrix,quantized_image);
    end
    sum_prob =sum_prob + findProb(i,label_matrix);
end
Saliency_Values = (Saliency_Values - min(Saliency_Values))/(max(Saliency_Values)- min(Saliency_Values));
my_saliency_map = label_matrix;
for i=1:85
    my_saliency_map(my_saliency_map == i) = Saliency_Values(i);
end
