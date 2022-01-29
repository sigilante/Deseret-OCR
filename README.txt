================
SINGLE GLYPHS
================
Objective: To obtain one token of each type for preliminary work.
All images of glyphs are 0.736 in. high, with variable width
=======
All images of glyphs are 0.736 in high, with variable width
BoM pages downloaded from archive.org as .JP2
Opened in Adobe Photoshop and sliced, renamed, and saved as individual .PNG
BoM Scan Pages Used for initial character sampling
0003
0010
0066
0182

================
CORPUS OF GLYPHS
================
Objective: To obtain a random sampling of multiple tokens of the same type:
BoM scan pages used
0005

Each line of full text (excluding lines in all caps) were sliced in Adobe Photoshop.
Frames were 0.736 in. high with variable width
Frames were aligned with the bottom of the comma and the top of the cap.

TODO: Mitigate frequency effects (glyphs like zhee and chee are rare)

Characters are extracted from [the Web Archive publication of the 1869 Book of Mormon](https://archive.org/details/bookofmormdeseretalpha00/page/28/mode/2up) under fair use provisions.

charproc.m pads character .pngs to dimensions of the tallest and widest characters, nearly centering the original glyph in the frame.
Light noise is added to minimize the effect of the white borders on clustering analysis.
Clustering analysis using kmeans with groups = 48 to accommodate 38 glyphs and 10 punctuation marks.
Relabeled images are found inc ..\chars-L\ where the prefix p0-c is followed by the glyph-type (01-48) and the serial id / unique identifier for the glyph
Notes on classification: 
(1) Caps are generally clustered (e.g., glyph-type 35) due to glyph size rather than shape;
(2) Clustering is less robust for highly similar shapes like long-a vs aw, long-o vs long-ah;
(3) Numerals and punctuation are not frequent enough, relatively speaking, to form their own classes;
(4) ..
TODO: Further assess clustering and optimize as needed

Glyphs organized into subfolders in chars-L. This was done by visual inspection of each kmeans cluster and manual copy and paste. The kmeans clustering did most of the heavy lifting. 
Problematic distinctions included aw/long-a; long-a/long-e; kay/gay; gay/long-aw. It is possible that a handful of determinations would be different if the words were found in context (e.g., a-long vs e-long)
TODO: Should majuscule and miniscules be organized together?
