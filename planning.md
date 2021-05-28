##### Impetus 
I've spent a lot of time in the past year learning (painfully) about the different ways to map and work with spatial data and finding how certain types of spatial data and coordinate systems are out of date or don't work together. I often hear that Python is better suited for working with spatial data than R, which hurts to hear when R is your favorite.  

##### Objective
Workshop for RLadies Boulder on spatial data and mapping in R. Points to cover:  
1. What are the different types of spatial data and what packages are the most important today (this changes pretty quickly)  
2. Go through a common workflow for converting non-spatial field data (e.g., CSV) to be spatial in R (e.g. shapefile, spatialpointsdataframe), and what this means?  
3. Work through some advanced mapping techniques to show the range of versatility of mapping in R. There are plenty of examples online that offer a few cookie cutter ways to map your data basically, but showing some cool expansions or extra features that are harder to find would be a good use of time  

##### Spatial data  
* sp vs sf packages
* file naming conventions. either personal or as a team. make a guide
* how to share QGIS data? hard to say
* reference that if you're using remote sensing data, use L0, L1, etc. naming convention. 
* CRS
* recent move from proj4 to prO(theta)4
* recommended to do analysis in UTM, but mapping in WGS84 (e.g. tmap requires WGS84)
* Resources:
  * https://cengel.github.io/rspatial/2_spDataTypes.nb.html

##### Mapping
* interactive maps (tmap, leaflet). Reference CU Boulder libraries uide

##### Relevant topics that I will not cover
* conversion from proj4 to ?? - when and why?
* working with Raster data (this will involve only vector data)




What is spatial data?
Spatial packages in R (specifically sp and sf and when they do/don't interact)
How to know what CRS to use?
interactive maps in R (tmap, leaflet)
if something isn't working with your spatial data, how to troubleshoot? (make a checklist throughout workshop to give them at the end - always ask stackoverflow and make spatial friends)
best practices in storing data (save large data files locally)

(1) Talk about what falls into the category of spatial data
(2) Background of the workflow conceptually from CSV to map (no R code yet)
(3) Relevant packages
(4) Basics of converting CSVs to shapefiles etc. and why
(5) Once the data is in working order, very brief basics of mapping 
(6) Cool examples of the range of versatility, harder to find stuff, maybe some sticking points that took you a while to work through and the solution.
