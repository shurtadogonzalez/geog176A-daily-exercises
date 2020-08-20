#Name:Stephanie Hurtado
#Date:8/18/20
#Exercise: 09


install.packages("sf")
library(sf)

install.packages("stars")
library(stars)

install.packages("units")
library(units)

installed.packages("raster")
library(raster)

install.packages("mapview")
library(mapview)

install.packages("leaflet")
library(leaflet)

install.packages("gdalUtilities")
library(gdalUtilities)

install.packages("whitebox", repos="http://R-Forge.R-project.org")

remotes::install_github("ropensci/getlandsat")

remotes::install_github("ropensci/USAboundaries")

remotes::install_github("ropensci/USAboundariesData")

remotes::install_github("ropenscilabs/rnaturalearthdata")

sf::sf_extSoftVersion()

