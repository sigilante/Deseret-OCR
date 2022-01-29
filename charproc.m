function [charstack,maxhidx,maxwidx] = charproc(mydir)
% Pad all characters to a uniform height and width based on the
% tallest and widest characters found in a folder of extracted characters
% (mydir).
% The original characters will be nearly centered in the output:
% charstack is a rectangular 3D matrix suitable for cluster analysis.
% maxhidx and maxwidx are the indices corresponding to the tallest and
% widest glyphs, respectively.
% imshow(charstack(:,:,maxhidx)) will show the padded version of the
% tallest character in the database

myfiles = dir(fullfile(mydir,'*.png'));
for i = 1:length(myfiles)
    mychar{i,1} = imread(strcat(mydir,myfiles(i,1).name));
    mysize(i,:) = size(mychar{i,1});
end
[maxh,maxhidx] = max(mysize(:,1));
[maxw,maxwidx] = max(mysize(:,2));

for i = 1:length(myfiles)
    mydim(i,:) = size(mychar{i,1});
    padchar{i,1} = padarray(mychar{i,1},[floor((maxh-mydim(i,1))/2),floor((maxw-mydim(i,2))/2)],0,'both');
    if size(padchar{i,1},1) < maxh
        padchar{i,1} = padarray(padchar{i,1},[1,0],0,'post');
    end
    if size(padchar{i,1},2) < maxw
        padchar{i,1} = padarray(padchar{i,1},[0,1],0,'post');
    end
    charstack(:,:,i) = padchar{i,1};
end