# Date: 22 Nov 2016
# Day 4 in R programming



#length(df$measure1)
#check this later
library(raster)
r1 <- raster(nrows=100,ncols=100)
r1
r1[] <- runif(1000) # To create df try to do it from previous class
plot(r1)

r2 <- raster(nrows=100,ncols=100)
r2
r2[] <- runif(1000) # same as df$measure1
plot(r2)

# To stack 2 sets into one
r12 <- stack(r1,r2)
r12 # check their properties
plot(r12)

# To plot first raster
plot(r12[[1]])

# Create a new raster layer
r12$new <- r12[[1]]*r12[[2]]^2
r12
plot(r12)

# Raster value back to data frame
df12 <- r12[]
head(df12)


#
#

#
# Redo from PDF
#

#
#

a <- sqrt(2)

if(a*a != 2)
{
  print("R is great")
}  
  
j <- 0
while(j <= 1)
{
  j <- j+0.1 ; print(j)
}
  
  # Creating own function
# General Sytax
# myfunction <- function(arg1, arg2,...)
# {
 #  statement
  # return(z)
# }

myfunction <- function(x, y)
{
  z <- x+y
  return(z)
}

myfunction(4,3)
# this is the answer = [1] 7
  
fun_ndvi <- function(nir, red)  {
  ((nir-red)/(nir+red))
}  

# example to create to an NDVI set using cond. create 4 layer and 3 and 4 as NIR and RED resp.

library(raster) 
r1 <- raster(nrows=100 ,ncols=100)
r1[] <- runif(1000)
r1$b2 <- runif(1000)
r1$b3 <- runif(1000)
r1$b4 <- runif(1000)

ndvi_func <- function(nir,red){
  (nir-red)/(nir+red)
}

ndvi <- ndvi_func(r1[[4]],r1[[3]])
plot(ndvi)



install.packages("cluster")
?kmeans

r1_df <- r1[] # convert raster value into data frame
r1_df[]
r1_df_out <- kmeans(r1_df, 5, nstart = 50)
r1_df_out
plot(r1_df, col())


# raster import in one band
band_3 <- raster("C:/Users/Bharath Selva/Desktop/EAGLE/Semester 1/MB1 - Digital Image Analysis and GIS/201617-Wi_04GeoMB1_CC/01_Data/02_Raster/Landsat-5_Ammersee/LT51930272003195MTI01/Func_Multispectral_LT51930272003195MTI01_RefTOA.tif", band=3)
# brick imports all band of a file
allband <- brick("C:/Users/Bharath Selva/Desktop/EAGLE/Semester 1/MB1 - Digital Image Analysis and GIS/201617-Wi_04GeoMB1_CC/01_Data/02_Raster/Landsat-5_Ammersee/LT51930272003195MTI01/Func_Multispectral_LT51930272003195MTI01_RefTOA.tif", band=3)

# displaying your multi_spectral data on RGB
plotRGB(allband, 3,2,1)

# maybe a color stretch is needed
plotRGB(allband, 3,2,1, stretch="lin")
