function result = myDistance(region1, region2, label_matrix_1, label_matrix_2)
n_1 = length(unique(label_matrix_1));
pixel_1 = unique(label_matrix_1);
n_2 = length(unique(label_matrix_2));
pixel_2 = unique(label_matrix_2);
result = 0;
for i=1:n_1
    for j=1:n_2
        term1 = findProb(pixel_1(i),label_matrix_1);
        term2 = findProb(pixel_2(j),label_matrix_2);
        term3 = DistanceModified(pixel_1(i), label_matrix_1, region1, ...
            pixel_2(j),label_matrix_2, region2);
        result = result + (term1*term2*term3);
    end
end