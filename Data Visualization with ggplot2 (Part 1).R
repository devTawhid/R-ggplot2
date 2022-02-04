library(ggplot2)
data <- mtcars
str(data)

# mtcarr dataset plotting example
#================================

ggplot(data, aes(x = wt,       # this two
                 y = mpg,      # are required
                 color = disp, # this is a mapping property
                 size = disp,  #
                 shape = as.factor(vs))) +
  geom_point();

# iris dataset plotting example
#==============================

data <- iris
str(data)

ggplot(data, aes(x = Sepal.Length,
                 y = Sepal.Width,
                 shape = Species,
                 color = Species)) +
  geom_point()

# diamon dataset example
#=======================

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


## detailed discussion about aes in ggplot
#========================================#

# we can use aes in in the geom layer too like this

data <- iris
str(data)

ggplot(data) +
  geom_point(aes(x = Sepal.Length, 
                 y = Sepal.Width,
                 shape = Species,
                 color = Species))

# all the attributes of AES is ggplot
#===================================
## required: 
#-----------
#   x = X axis position
#   y = Y axis position

## optional:
#-----------
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
  geom_point(shape = 21, size = 4, alpha = .6)











