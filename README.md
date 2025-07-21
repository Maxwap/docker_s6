My main goal for this exam was to build a Docker stack that was as close to production-ready as possible, focusing heavily on security. This was a significant improvement over last year's exam files, as I spent time implementing a multi-stage Dockerfile with a non-root user and switching to a production-grade server like Uvicorn. For Docker Compose, I used secrets for the database password and added a healthcheck to make sure the app starts up reliably.

The Dockerfile and Compose parts went smoothly. Where I got stuck for a bit was the GitHub Actions workflow. I ran into some frustrating but common issues, like command not found errors and incorrect file paths for the secrets. It took several tries to debug, and unfortunately, I ran out of time to get the workflow fully working.

To make this stack truly production-ready, the next steps would be:

    Add Monitoring & Logging: Integrate tools like Prometheus/Grafana.

    Automate Security: Add a vulnerability scanning step (like Trivy) to the CI pipeline.

    Orchestrate: Deploy it all on Kubernetes for proper scaling and high availability.
