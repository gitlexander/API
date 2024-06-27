# plumber.R

library(plumber)

# Define a Plumber router
r <- plumb()

# Example endpoint
r$handle("GET", "/hello", function(req, res) {
  list(message = "Hello, world!")
})

# Run the API
if (Sys.getenv("PORT") != "") {
  pr <- plumber$new()
  pr$bind(port = as.numeric(Sys.getenv("PORT")))
  pr$run()
} else {
  pr <- plumber$new()
  pr$run(port = 8000)
}

