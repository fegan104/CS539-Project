function f = flatten_images(images)
    [w, h, count] = size(images);
    flat = zeros(count, w*h);
    for i = 1:count
        img = images(:, :, i);
        flat(i, :) = img(:);
    end
    
    f = flat;
end