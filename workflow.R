library(sp)
library(sf)
library(rgdal) #readOGR()
library(tmap)
#library(readr) #read_csv
library(raster) #crs()
#library(dplyr)
#library(tidyverse)
#library(ggplot2)

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

# Try another backdrop. There are many to choose from 
tm_shape(frags_sf_reproj) +
        tm_fill(alpha=0) +
        tm_borders("lightblue", lwd=2) +
    tm_shape(sites_sf) +
       tm_dots(col="place") 

# Try satellite backdrop
tm_shape(frags_sf_reproj) +
        tm_fill(alpha=0) +
        tm_borders("lightblue", lwd=2) +
    tm_shape(sites_sf) +
       tm_dots(col="place") +
    tm_basemap(providers$Esri.WorldImagery)

# Save as html
tmap_last() %>% 
    tmap_save("figures/wogwog_esribackdrop.html")



# You can customize the backdrop in case you have a higher resolution orthomosaic of your site  