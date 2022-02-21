function pixelProb = findProb(pixel,label_matrix)
Total_elements = numel(label_matrix);
Total_pixels = sum(reshape(label_matrix,1,[]) == pixel);
pixelProb = double(Total_pixels/Total_elements);