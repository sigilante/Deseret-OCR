function [padchar] = charproc(mydir)

myfiles = dir(fullfile(mydir,'*.png'));
for i = 1:length(myfiles)
    mychar{i,1} = imread(strcat(mydir,myfiles(i,1).name));
    mysize(i,:) = size(mychar{i,1});
end
maxh = max(mysize(:,1));
maxw = max(mysize(:,2));

for i = 1:length(myfiles)
    padchar{i,1} = padarray(mychar{i,1},[myh,myw]);
end