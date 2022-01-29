function [padchar,maxhidx,maxwidx] = charproc(mydir)
% Pad all characters to a uniform height and width corresponding to the
% tallest (left-bracket-glyph) and widest (g-glyph) characters

myfiles = dir(fullfile(mydir,'*.png'));
for i = 1:length(myfiles)
    mychar{i,1} = imread(strcat(mydir,myfiles(i,1).name));
    mysize(i,:) = size(mychar{i,1});
end
[maxh,maxhidx] = max(mysize(:,1));
[maxw,maxwidx] = max(mysize(:,2));

for i = 1:length(myfiles)
    mydim(i,:) = size(mychar{i,1});
    padchar{i,1} = padarray(mychar{i,1},[floor(maxh-mydim(i,1)/2),floor(maxw-mydim(i,2)/2)],0,'both');
end