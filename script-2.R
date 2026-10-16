library(tidyverse)

# Had an OK filet mignon at Cheesecake Factory

set.seed(123)
diamonds_50000 <- diamonds |> slice_sample(n = 50000)

hist_p <- ggplot(diamonds_50000, aes(x = carat)) +
  geom_histogram(binwidth = 0.05, boundary = 0) +
  scale_x_continuous(breaks = 0:5) +
  scale_y_continuous(breaks = seq(0, 8000, by = 2000)) +
  coord_cartesian(xlim = c(0, 5), ylim = c(0, 8000)) +
  labs(
    title = "Histogram of Carat (weight) among 50,000 diamonds",
    x = "Carat",
    y = "Number"
  )

ggsave(plot = hist_p, file = "diamonds.png", width = 8, height = 5, dpi = 300)
