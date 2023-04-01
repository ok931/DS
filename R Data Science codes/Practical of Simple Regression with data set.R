# install usingR and ggplot2 packages; packages already installed; loading them using library()
library(UsingR)
# Require ggplot2 and UsingR
require(UsingR)
require(ggplot2)
# The first 10 observation of our dataset using the print(head(data, n = 10)) function
print(head(father.son, n = 10))
print(tail(father.son, n = 10))
str(father.son)
summary(father.son)
# Histogram of father's height distribution
ggplot(data = father.son, mapping = aes(x = fheight)) +
  geom_histogram(bins = 30, fill = "seagreen") +
  ggtitle("Histogram of Father's Height") +
  theme(plot.title = element_text(hjust = 0.5)) 
# Calculate Linear regression using lm() function
(height.lm <- lm(sheight ~ fheight, data = father.son))
# Complete regression results using summary() function
(summary(height.lm))
