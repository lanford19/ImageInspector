
function render_imtool(img)
%img = imread('car.jpg');
%[m,n,l] = size(img);
%figure;
%set(gcf,'position', [0, 0, 0,0]);
%imshow(img);

window = 800;  %660
% = imread('points.jpg');
[m,n,l] = size(img);
if m >= n
    m1 = window;
    n1 = n/m * window;
else 
    n1 = window;
    m1 = m/n * window;
end

img1 = imresize(img,[m1 n1]);
imshow(img1);
%handle_img = gcf;
%color = get(handle_img,'size');
%set(gca,'position',[0,0,0.9,0.9]);
%set(gcf, 'unit','normalized','position', [0.2,0.2,0.64,0.32]);
%set(gca,'position',[0,0,0.9,0.9]);
%v = get(0,'ScreenSize');
hfigure  = imtool(img1);

set(hfigure,'name','this is a figure');
%c = get(hfigure,'size');
%hfigure = imtool(img);
%set(hfigure,'position',[0,0,0.1,0.8]);
%imtool(img, 'InitialMagnification', 50)
%figure;imshow(img);
%set(gca,'position',[0,0,0.9,0.9]);
%x = 0 : 0.1 : 10;
%y = sin(x);
%plot(x,y);
