function euclidean_dist = DistanceModified(value1,label_matrix1,quantised_image1, ...
    value2, label_matrix2, quantised_image2)

[row1, col1] = find(label_matrix1 == value1);
[row2, col2] = find(label_matrix2 == value2);
% disp(quantised_image1)
color1 = quantised_image1(row1(1),col1(1),:);
color2 = quantised_image2(row2(1),col2(1),:);
%disp((color1))
%disp((color2))
r1 = double(color1(1,1,1));
r2 = double(color2(1,1,1));
g1 = double(color1(1,1,2));
g2 = double(color2(1,1,2));
b1 = double(color1(1,1,3));
b2 = double(color2(1,1,3));
euclidean_dist = sqrt((r1-r2)^2 + (g1-g2)^2 + (b1-b2)^2);