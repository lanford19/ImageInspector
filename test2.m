img_car = imread('car.jpg');
get_name(img_car)


function get_name(img)
img_name  = inputname(1);
scale = 20;
display = sprintf("%s %d%s",img_name,scale,'%');
disp(display);

imshow(img);
end