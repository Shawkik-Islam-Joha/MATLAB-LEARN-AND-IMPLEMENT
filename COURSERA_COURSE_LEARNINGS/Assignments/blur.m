% Write a function called blur that blurs the input image. The function is to be called like this:
% output = blur(img,w);
% where img, the input image is a two-dimensional matrix of grayscale pixel values between 
% 0 and 255. Blurring is to be carried out by averaging the pixel values in the vicinity of 
% every pixel. Specifically, the output pixel value is the mean of the pixels in a square 
% submatrix of size 2w+1 where the given pixel sits in the center. For example, if w is 1, 
% then we use a 3x3 matrix, that is, we average all the neighboring pixels of the given
% pixel and itself. Only use valid pixels when portions of the blurring matrix fall outside 
% the image. For example, the blurred value corresponding to w = 1 at index (1,1) would be the 
% mean of of elements (1,1), (1, 2), (2,1) and (2, 2). Both input img and output output are of 
% type uint8.

function output = blur(img, w)
    % Ensure input is uint8
    img = uint8(img);
    [rows, cols] = size(img);
    output = zeros(rows, cols, 'uint8');
    
    % Iterate through each pixel
    for i = 1:rows
        for j = 1:cols
            % Define the square submatrix bounds
            row_start = max(1, i - w);
            row_end = min(rows, i + w);
            col_start = max(1, j - w);
            col_end = min(cols, j + w);
            
            % Extract the submatrix
            submatrix = img(row_start:row_end, col_start:col_end);
            
            % Calculate mean and convert to uint8
            output(i, j) = uint8(mean(submatrix(:)));
        end
    end
end