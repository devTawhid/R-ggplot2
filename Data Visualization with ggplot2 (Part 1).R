#===============
library(ggplot2)
data <- mtcars
str(data)

# dataset plotting example
#===========mtcarrs=====================

ggplot(data, aes(x = wt,       # this two
                 y = mpg,      # are required
                 color = disp, # this is a mapping property
                 size = disp,  #
                 shape = as.factor(vs))) +
  geom_point();


#===========iris===================

data <- iris
str(data)

ggplot(data, aes(x = Sepal.Length,
                 y = Sepal.Width,
                 shape = Species,
                 color = Species)) +
  geom_point()

# dataset example
#===========diamon============

data <- diamonds
str(data)

ggplot(data, aes(x, y,
                 color = cut,
                 shape = clarity)) +
  geom_point() +
  theme_dark()

ggplot(data, aes(carat, price,
                 color = clarity)) + 
  geom_point(alpha = 0.4)

# saving plot data in a VARIABLE

plt_price_vs_carat <- ggplot(diamonds,aes(carat, price))
plt_price_vs_carat + geom_point()

# another example with TRANPERENCY

plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))
plt_price_vs_carat_transparent <- plt_price_vs_carat + geom_point(alpha = .2)
plt_price_vs_carat_transparent


# another example with COLOR

plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))
plt_price_vs_carat_by_clarity <- plt_price_vs_carat + geom_point(aes(color = clarity))
plt_price_vs_carat_by_clarity

#====================

## detailed discussion about aes in ggplot
#========================================

# we can use aes in in the geom layer too like this

data <- iris
str(data)

ggplot(data) +
  geom_point(aes(x = Sepal.Length, 
                 y = Sepal.Width,
                 shape = Species,
                 color = Species))

# all the attributes of AES is ggplot
#===========AES=================
## required: 
#-----------#
#   x = X axis position
#   y = Y axis position

## optional:
#-----------#
#   fill = color of points, outlines of other geoms
#   size = Area or radius of points thickness of lines
#   alpha = Transparency
#   linetype = line dash pattern
#   labels = Text on a plot or axes
#   shape = shape

#
str(mtcars)
ggplot(mtcars, aes(x = mpg, 
                   y = as.factor(cyl))) +
  geom_point()

#
ggplot(mtcars, aes(x = as.factor(cyl), 
                   y = mpg)) +
  geom_point()

#
ggplot(mtcars, aes(x = wt, 
                   y = mpg,
                   color = cyl)) +
  geom_point()

#
ggplot(mtcars, aes(x = wt, 
                   y = mpg,
                   color = cyl)) +
  geom_point(shape = 1,
             size = 4)



#
str(mtcars)
ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   fill = cyl,
                   size = am)) +
  # Change point shape; set alpha
  geom_point(shape = 21, 
             size = 4, 
             alpha = .6)



#
# Establish the base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(x = wt,
                                    y = mpg))

# Map fcyl to size
plt_mpg_vs_wt +
  geom_point(aes(size = cyl))

plt_mpg_vs_wt +
  geom_point(aes(alpha = cyl))

plt_mpg_vs_wt +
  geom_point(aes(shape = as.factor(cyl)))

plt_mpg_vs_wt +
  geom_text(aes(label = as.factor(cyl)))

#updating aes labs
ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar() +
  # Set the axis labels
  xlab("Number of Cylinders") + 
  ylab("Count")

#jitter using 
# Plot 0 vs. mpg
ggplot(mtcars, aes(mpg, 0)) +
  # Add jitter 
  geom_point(position = "jitter")


#======================

#GEOMETRY
#========
str(economics)
ggplot(economics, aes(date, 
                      unemploy,
                      color = pce)) +
  geom_line()

#barplot
# Plot fcyl, filled by fam
ggplot(mtcars, aes(as.factor(cyl), fill = as.factor(am))) +
  # Add a bar layer
  geom_bar(position = "dodge", width = .5) #dodge
#theme(legend.position = "new_value")



iris_min <- iris %>%
  group_by(Species) %>%
  summarise_all(mean)


ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() + 
  geom_point(data = iris_min, shape = 16, size = 5) +
  ggtitle("Iris data")

#=========================

#===========geom_point=====

# A hexadecimal color
my_blue <- "#4ABEFF"

ggplot(mtcars, aes(wt, mpg)) +
  # Set the point color and alpha
  geom_point(color = my_blue,
             alpha = .6)


# A hexadecimal color
my_blue <- "#4ABEFF"

# Change the color mapping to a fill mapping
ggplot(mtcars, aes(wt, 
                   mpg, 
                   fill = cyl)) +
  # Set point size and shape
  geom_point(color = my_blue,
             size = 10,
             shape = 1)


#
ggplot(mtcars, aes(x = wt, 
                   y = mpg,
                   color = cyl)) +
  geom_point(alpha = .5)

#
ggplot(mtcars, aes(x = wt, 
                   y = mpg,
                   color = cyl)) +
  geom_text(label = rownames(mtcars), 
            color = "red")


ggplot(mtcars, aes(x = wt, 
                   y = mpg,
                   color = cyl)) +
  geom_point(color = "yellow",
             shape = 24,)


#
# 5 aesthetics: add a mapping of size to hp / wt
ggplot(mtcars, aes(x = mpg, 
                   y = qsec, 
                   color = as.factor(cyl), 
                   shape = as.factor(am),
                   size = hp/wt)) +
  geom_point()



#
# Plot 0 vs. mpg
ggplot(mtcars, aes(0, mpg)) +
  # Add jitter 
  geom_point(position = "jitter")


#
ggplot(mtcars, aes(mpg, 0)) +
  geom_jitter() +
  # Set the y-axis limits
  ylim(-2,2)

#===========================

#===========geom_histogram======
# Plot mpg
ggplot(mtcars, aes(x = mpg)) +
  # Add a histogram layer
  geom_histogram()


# Update the aesthetics so the fill color is by fam
ggplot(mtcars, aes(mpg, fill = fam)) +
  geom_histogram(binwidth = 1)


#=========================

#===========geom_bar======

# Plot fcyl, filled by fam
ggplot(mtcars, aes(fcyl, fill = fam)) +
  # Add a bar layer
  geom_bar()

ggplot(mtcars, aes(cyl, fill = fam)) +
  # Change position to use the functional form, with width 0.2
  geom_bar(position = position_dodge(width = 0.2))

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = vocabulary)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1")

ggplot(mtcars, aes(as.factor(cyl), fill = as.factor(am))) +
  geom_bar() +
  # Set the axis labels
  xlab("Number of Cylinders") + 
  ylab("Count")

#
palette <- c(automatic = "#377EB8", manual = "#E41A1C")

ggplot(mtcars, aes(as.factor(cyl), fill = as.factor(am))) +
  geom_bar(position = "dodge") +
  labs(x = "Number of Cylinders", y = "Count")

#===============================

#==========geom_line==============

# Print the head of economics
head(economics)

# Using economics, plot unemploy vs. date
ggplot(economics, aes(date, unemploy)) +
  # Make it a line plot
  geom_line()

# Plot the Rainbow Salmon time series
str(fish.species)
str(fish.tidy)
ggplot(fish.species, aes(x = Year, y = Rainbow)) +
  geom_line()

#==============================



