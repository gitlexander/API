# plumber.R

library(plumber)

# Define a Plumber router
r <- plumb()

# Example endpoint
r$handle("GET", "/", function(req, res) {
  res$status(200)
  list(message = "Hello, world!")
})
