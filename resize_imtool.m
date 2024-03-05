
function resize_imtool(img, windowsize)  %660
[m,n,l] = size(img);
if m >= n
    m1 = windowsize;
    n1 = n/m * windowsize;
    scale = windowsize/m;
else 
    n1 = windowsize;
    m1 = m/n * windowsize;
end
scale_per = round(scale *100);
img_name = inputname(1);
display = sprintf("%s %d%s",img_name,scale_per,'%');
img1 = imresize(img,[m1 n1]);
hfigure  = imtool(img1);
set(hfigure,'name',display,'NumberTitle','on');

