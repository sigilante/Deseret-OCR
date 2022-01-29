function [] = charproc(mydir,mygrps,glyphdir)
% Pad all characters to a uniform height and width based on the
% tallest and widest characters found in a folder of extracted characters
% (mydir). noise is added to the images to minimize the effect of 
% padding on cluster analysis.
% The original characters will be nearly centered in the output:
% charstack is a rectangular 3D matrix.
% maxhidx and maxwidx are the indices corresponding to the tallest and
% widest glyphs, respectively.
% imshow(charstack(:,:,maxhidx)) will show the padded version of the
% tallest character in the database
% charmat is fully ready for kmeans clustering
% run k means analysis on pixel data using grps (49 for 38 glyphs + 10
% punctuation marks .,:;!?-[] and em-dash
% save to a folder of glyphs with original pngs renamed according to their
% k-means idx number
% output png: 'p0-c' = prefix; n = kmeans-based glyph type, -, p = serial id
% 

pngnames = dir(fullfile(mydir,'*.png'));
for i = 1:length(pngnames)
    mychar{i,1} = imread(strcat(mydir,pngnames(i,1).name));
    mysize(i,:) = size(mychar{i,1});
end
[maxh,maxhidx] = max(mysize(:,1));
[maxw,maxwidx] = max(mysize(:,2));

for i = 1:length(pngnames)
    mydim(i,:) = size(mychar{i,1});
    padchar{i,1} = padarray(mychar{i,1},[floor((maxh-mydim(i,1))/2),floor((maxw-mydim(i,2))/2)],255,'both');
    if size(padchar{i,1},1) < maxh
        padchar{i,1} = padarray(padchar{i,1},[1,0],255,'post');
    end
    if size(padchar{i,1},2) < maxw
        padchar{i,1} = padarray(padchar{i,1},[0,1],255,'post');
    end
    charstack(:,:,i) = imnoise(padchar{i,1},'poisson');
    mymat = double(charstack(:,:,i));
    charmat(:,i) = mymat(:)';
end

kidx = kmeans(charmat',mygrps);

for i = 1:length(kidx)
    if kidx(i) < 10
        pngname{i,1} = strcat(glyphdir,'p0-c',num2str(0),num2str(kidx(i)),'-',num2str(i),'.png');
    else
        pngname{i,1} = strcat(glyphdir,'p0-c',num2str(kidx(i)),'-',num2str(i),'.png');
    end
   imwrite(mychar{i,1},pngname{i,1})
end