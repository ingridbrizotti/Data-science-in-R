
#########################################################################
####              INFOGRAPHICS STYLE CHARTS IN R                     ####
#########################################################################

# Check Source at https://nsaunders.wordpress.com/2017/09/08/infographic-style-charts-using-the-r-waffle-package/


# 1) Install R packages

install.packages(c("waffle", "extrafont"))

library(waffle)
library(extrafont)


# 2) Install Font Awesome

# Go to http://fontawesome.io/ 
# Download and install
# Unzip the file and navigate to the fonts directory. To install the font, use the file named fontawesome-webfont.ttf. 
# For Windows or Mac OS X users, installation is as simple as double-clicking the file and choosing “Install”


# 3) Import and register fonts

font_import()

# check that Font Awesome is imported
fonts()[grep("Awesome", fonts())]
# [1] "FontAwesome"

# If you run font_import() in a session, you need to register the fonts with the R output device. 
# Otherwise, this occurs when the package is loaded. If you’re using the Windows OS and want to plot to the screen in RStudio, 
# an additional argument is required:

# this should be fine for Mac OSX
loadfonts()
# use this if things look odd in RStudio under Windows
#loadfonts(device = "win")


# 4) Create charts

waffle(c(50, 30, 15, 5), rows = 5, title = "Your basic waffle chart")


# Next, using icons. You can browse or search for available icon name at
# http://fontawesome.io/icons/

waffle(c(50, 30, 15, 5), rows = 5, use_glyph = "rocket", glyph_size = 6, 
       title = "Look I made an infographic using R!")


# You can use the iron() function to append waffle charts, which might be useful in comparisons. 
# Here’s some made-up data involving some aspect of cars in two unnamed countries:


iron(
  waffle(c(no = 80, yes = 20), rows = 5, use_glyph = "car", glyph_size = 6, 
         colors = c("#c7d4b6", "#a3aabd"), title = "Country A"),
  waffle(c(no = 70, yes = 30), rows = 5, use_glyph = "car", glyph_size = 6,
         colors = c("#c7d4b6", "#a3aabd"), title = "Country B"))