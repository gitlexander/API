# Use the official R image from the Docker Hub
FROM r-base:latest

# Install Plumber package
RUN R -e "install.packages('plumber', repos='http://cran.us.r-project.org')"

# Copy the API script into the Docker image
COPY api.R /api.R

# Expose the port Plumber will run on
EXPOSE 8000

# Run the Plumber API
CMD ["R", "-e", "pr <- plumber::plumb('/api.R'); pr$run(host = '0.0.0.0', port = as.numeric(Sys.getenv('PORT', 8000)))"]
