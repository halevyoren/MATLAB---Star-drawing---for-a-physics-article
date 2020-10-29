# Trainer

Trainer is a program that take a background image (of size 4908x3264 px) and draw on it "stars" using many parameters (there is also a "finder" that finds all the stars, but that will be added later on), it was made for an article in physics (yet to be published).


## how to run the program



1. Open matlab at the folder containing all the files ("Background.tif", "star.tif", "FTA_Trainer_32.fig", "FTA_Trainer_32.m").
	you can run it the program on the "Background.tif" (which is the default BG) or on another picture that is 4908x3264 px.
2. Make sure parameters are correct.
3. Click "RUN".
4. Either go back to step 1 (start over) or Make sure parameters are correct and click "Add Star" and repeat step 4 unitl done.

Note *before running step 4 for the first time*: in order to make sure that the star is in the correct place you click on the image the you can calibrate the image size to your screen.
you can do that by checking "allow screen calibration" the clicking on the top left corner of the image and then clicking "top left" and doing the same with the bottom right corner.
once you are done then you can uncheck the checkbox so you don't change the calibration by mistake. 


## parameters for "RNU":
* Fixed place - In case of more than one cycle (number of times running on the same image in a row) then the star's center will be the same each time.
* Fixed Intensity - The star's diameter is the same (affects the number of leafs), for example the first 3 stars diameters are 0.5, 0.6, 0.8 respectivly.
* Star Center - Put a red circle in the middle of each star (even if there are no leafs for that star).
* Fixed BG - Choose "Background.tif" as a background to draw upon.
* Particles size - If Fixed Intensity is not chosen then for each choose a random particle size from its corresponding array.
* Brightness - Choose by how much to brighten the image before starting to draw the stars(to eliminate backgound noise).
* No. Cycles - Number of times running on the same image in a row.
* Line Width - Choose the width of each leaf of the stars (with a small fluxuation) 
* No. Stars - How many stars to draw.
* min Length - The minimum length of a leaf.
* max Length - The maximun length of a leaf (maximum length will be a random number between min Length and min Length + max Length).
* Delta - The maximum distance of a leaf from the stars center.
* Line Dis.- Distance of leaf from each of its size. (For each leaf there are 3 lines, the main one and on each side a slightly brighter line) (currently removed in the code) 
* close all at the end - At the end of the run close all window exept for the main GUI.
* enrichment - Physical parameter affecting the number of leafs of each star.
* phi - Physical parameter affecting the number of leafs of each star.
* sigma - Physical parameter affecting the number of leafs of each star.
* time [min] - Physical parameter affecting the number of leafs of each star.
* eff - Physical parameter affecting the number of leafs of each star.

## parameters for "Add Star" (which can only be chosen after there was a "RUN"):
* Particle Diameter - Particle diameter for the star the program is adding.
* x location - x coordinate on the image, where the star will be added.
* y location - y coordinate on the image, where the star will be added. 
* Star Center - Put a red circle in the middle of each star (even if there are no leafs for that star).
* Brightness - Choose by how much to brighten the image before starting to draw the stars(to eliminate backgound noise).
* Line Width - Choose the width of each leaf of the stars (with a small fluxuation) 
* min Length - The minimum length of a leaf.
* max Length - The maximun length of a leaf (maximum length will be a random number between min Length and min Length + max Length).
* Delta - The maximum distance of a leaf from the stars center.
* Line Dis.- Distance of leaf from each of its size. (For each leaf there are 3 lines, the main one and on each side a slightly brighter line) (currently removed in the code) 
* close all at the end - At the end of the run close all window exept for the main GUI.
* enrichment - Physical parameter affecting the number of leafs of each star.
* phi - Physical parameter affecting the number of leafs of each star.
* sigma - Physical parameter affecting the number of leafs of each star.
* time [min] - Physical parameter affecting the number of leafs of each star.
* eff - Physical parameter affecting the number of leafs of each star.

