FROM ghcr.io/dhis2-chap/chapkit-r-cli:latest
WORKDIR /work
COPY .Rprofile renv.lock ./
COPY renv/activate.R renv/settings.json renv/
RUN Rscript -e "renv::restore(prompt = FALSE)"
COPY . .
