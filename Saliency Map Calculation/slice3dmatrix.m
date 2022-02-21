function myMatrix = slice3dmatrix(image3d, mask)
image1 = image3d(:,:,1);
image2 = image3d(:,:,2);
image3 = image3d(:,:,3);
image1 = image1(mask);
image2 = image2(mask);
image3 = image3(mask);
myMatrix(:,:,1) = image1;
myMatrix(:,:,2) = image2;
myMatrix(:,:,3) = image3;