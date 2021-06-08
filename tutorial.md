# From csv to slippy map: Intro to spatial data in R

Anna Spiers, CU Boulder  
08 June 2021
R Ladies Boulder Chapter Meetup

AIS sexy map here

**Learning objectives**  
1. Describe what distinguishes spatial data
2. Understand the basic differences between the `sp` and `sf` packages
3. Reproject 
4. 

### What is spatial data?

AIS BIG IMAGE HERE OF ALL THE EXAMPLES
examples: field sites, rivers, county boundries, elevation maps, point clouds, ...

  * **what falls into this category?**
  * 
  * each of these fall into a different bucket... (visualize a circle around examples grouped by raster (2d), vector(1d), spatial point clouds(3d)) 
  * we'll work with vectors (1d) today
    * points (field sites), lines (rivers), polygons (county boudnaries)
    * following the use case where you have coordinates of field sites in an ecological application, municipalities in a political analysis, or (what's another example? psychological?)


 * format of spatial data 
   * csv stores coordinates, but this isn't spatial
   * shp and kml's are vector data objects, but what's the difference?
* why use spatial data?
  * gives you access to a universe of spatial tools that already exist and can assist you in your analyses
  * more versatility in plotting spatial data than a plain dataframe


##### Overview
* **Background of the workflow conceptually from CSV to map (no R code yet)**
* **relevant packages**: spatial data in R
  * `sp` vs `sf` packages (when they do/don't they interact)
    * many of their data types have the same names, and some work together, but not all and this can be very confusing
  * `sp`
    * first released on CRAN in 2005
    * offers functionality to create and modify vector data and grids
    * many (about 350) of R's spatial packages use `sp` as a dependency
    * 
  * `sf`
    * first released on CRAN in ???


##### Example: Wog Wog
* introduce our field site and work I do there
* I am converting a lot of our data on paper to be spatial and to talk to each other (e.g., same CRS)
* visualize in QGIS
* visualize overview: Background of the workflow conceptually from CSV to map (no R code yet)
2. Go through a common workflow for converting non-spatial field data (e.g., CSV) to be spatial in R (e.g. shapefile, spatialpointsdataframe), and what this means?  



##### Mapping
3. Work through some advanced mapping techniques to show the range of versatility of mapping in R. There are plenty of examples online that offer a few cookie cutter ways to map your data basically, but showing some cool expansions or extra features that are harder to find would be a good use of time  

* geojson.io or google earth - use to extract polygons or lines
* https://www.vdatum.noaa.gov/ - if you need a niche CRS
* view raster data: see what scott sent
* view point cloud data: website from Leah's lesson


* So you have a csv of coordinates, what do you do?: 
  * convert to shp/kml - **Basics of converting CSVs to shapefiles etc. and why**
  * but what CRS? 
    * global vs projected
    * Google maps coordiantes are in ?
    * best to do spatial analyses using a projection like your UTM zone (CO is 13N, Wog Wog is 55S) - include image of UTM zones 
* **Once the data is in working order, very brief basics of mapping **
* static maps... introduce this or no?
* interactive maps in R (tmap, leaflet). 
  * many ways to do this, but I will use `tmap`
  * *Reference CU Boulder libraries guide*
  * how to change which label is visible (change order in spdf)


##### Misc
* **Cool examples of the range of versatility, harder to find stuff, maybe some sticking points that took you a while to work through and the solution.**
* use naming convention - agreed upon by team or standard (e.g., remote sensing data: L0, L1, etc.)
* pay attention to CRS
  * recommended to do analysis in UTM, but mapping in WGS84 (e.g. tmap requires WGS84)
* best practices in storing data (save large data files locally)
* I recommend visualizing your data in a GIS first, like QGIS, as a sanity check. right crs? does this look right? do data nearby each other appear nearby?


##### Troubleshooting
* always ask stackoverflow and your spatial friends


##### Relevant topics that I will not cover
* conversion from proj4 to prO(theta)4 - when and why?
* working with Raster data (this will involve only vector data)
* QGIS stuff... how to share QGIS data? 

##### My resources for this presentation:
* https://cengel.github.io/rspatial/2_spDataTypes.nb.html
* https://www.nceas.ucsb.edu/sites/default/files/2020-04/OverviewCoordinateReferenceSystems.pdf
*

To do
 - export as md
 - fill out learning objectives
 - add photos throughout