library(plumber)

# Define a Plumber router
r <- plumb()

# Create an endpoint for your function
r$handle("GET", "/sum", function(a, b) {
  result <- as.numeric(a) + as.numeric(b)
  list(result = result)
})

# Run the API
r$run(host = "0.0.0.0", port = as.numeric(Sys.getenv("PORT", 8000)))
