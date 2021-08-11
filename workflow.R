# Csv to slippy workflow as R script

library(sp)
library(sf)
library(rgdal) #readOGR()
library(tmap)
library(raster) #crs()
library(tmaptools) #read_osm()
library(OpenStreetMap) #read_osm()

# Load field sites
sites <- read.csv("data/example_sites_WGS84.csv")
head(sites)

# Convert dataframe to spatial data using sf
sites_sf <- sf::st_as_sf(sites, coords=c("lon", "lat"))
st_crs(sites_sf) <- 4326
head(sites_sf)

# Load fragment boundaries (already a shp) through sp and sf packages
frags_sp <- readOGR("data/example_frag_outlines_UTM")
frags_sf <- st_read("data/example_frag_outlines_UTM")

frags_sp
frags_sf

# Going forward, let's use sf objects. I was trained with sp, but sf seems like the package for the future

# Plot sites
plot(sites_sf)
plot(st_geometry(sites_sf))

# Plot fragment boundaries and sites
plot(frags_sf)
plot(st_geometry(frags_sf))

#Plot sites and fragment boundaries together
plot(st_geometry(frags_sf))
plot(st_geometry(sites_sf), pch=19, add=T)
# Why don't we see them together. 

# Troubleshoot: think to CRS first. 
crs(frags_sf)
crs(sites_sf)
# They're different. The fragments are in a UTM projection

# Transform fragments object to have same CRS as sites
frags_sf_reproj <- st_transform(frags_sf, 4326)



# This map is sufficient for a basic visualization, but we can do better

# Interactive mapping
# tmap
tmap_mode("view")

tm_shape(frags_sf_reproj) +
        tm_fill(alpha=0) +
        tm_borders("lightblue", lwd=2) +
    tm_shape(sites_sf) +
       tm_dots(col="place")
# Note the word bubbles that pop up when you click on a spatial object

# You can control what text appears in the word bubble. See the popup.vars variable below
tm_shape(frags_sf_reproj) +
        tm_fill(alpha=0,
                   popup.vars=c("Size: "="size",
             "Replicate: " = "rep")) +
        tm_borders("lightblue", lwd=2) +
    tm_shape(sites_sf) +
       tm_dots(col="place")


# Hover over fragments. It displays the size. 
# If you want to change which attribute is displayed in the hover bubble, then change the order of attributes in the spatial object
frags_sf_reproj <- frags_sf_reproj[ , c("rep", "size", "geometry")]  

tm_shape(frags_sf_reproj) +
        tm_fill(alpha=0) +
        tm_borders("lightblue", lwd=2) +
    tm_shape(sites_sf) +
       tm_dots(col="place")
# Now replicate number displays in hover bubble over fragment polygon

# Try a satellite backdrop. 
tm_shape(frags_sf_reproj) +
        tm_fill(alpha=0) +
        tm_borders("lightblue", lwd=2) +
    tm_shape(sites_sf) +
       tm_dots(col="place") +
    tm_basemap(providers$Esri.WorldImagery)

# Try a topographic map backdrop. There are many to choose from 
tm_shape(frags_sf_reproj) +
        tm_fill(alpha=0) +
        tm_borders("lightblue", lwd=2) +
    tm_shape(sites_sf) +
       tm_dots(col="place") +
    tm_basemap(providers$Esri.WorldTopoMap)

# Save as html
tmap_last() %>% 
    tmap_save("figures/wogwog_esribackdrop.html")


# EXTRA: Plot a map with your own raster backdrop (swap in your own raster file below)
ortho_blue <- raster("data/20190216_233616_101f_3B_AnalyticMS_clip.tif",band=1)
ortho_green <- raster("data/20190216_233616_101f_3B_AnalyticMS_clip.tif",band=2)
ortho_red <- raster("data/20190216_233616_101f_3B_AnalyticMS_clip.tif",band=3)
ortho_brick <- brick(ortho_red, ortho_green, ortho_blue)
plotRGB(ortho_brick, r=1, g=2, b=3)

# Reproject from UTM Zone 55S to WGS 84
ortho_4326 <- projectRaster(ortho_brick, crs="+init=epsg:4326", method = "ngb")  
ortho_background <- read_osm(bbox(ortho_4326))

tm_shape(ortho_background) + 
        tm_raster() +
    tm_shape(frags_sf_reproj) + 
        tm_fill(alpha=0) +
        tm_borders("lightblue", lwd=2) +
    tm_shape(sites_sf) + 
       tm_dots(col="place") 
