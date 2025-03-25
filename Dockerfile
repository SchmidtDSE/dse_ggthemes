# !!!IMPORTANT!!!
#
# RUN WITH FOLLOWING COMMAND ON TERMINAL:
#
# docker build --platform linux/amd64 -t ggthemes-image "."
#
# potentially need to run the following command before (tbd test):
#
# docker pull --platform linux/amd64 ghcr.io/rocker-org/devcontainer/tidyverse:4.3
#
# afterwards to start things out:
#
# docker build --platform linux/amd64 -i -t <container id> /bin/bash
#
#
# TBD: how does this all relate to a "normal" docker build (docker build --tag "name" .)


# Pre-built Dev Container Image for R. More info: https://github.com/rocker-org/devcontainer-images/pkgs/container/devcontainer%2Ftidyverse
# Available R version: 4, 4.1, 4.0
ARG VARIANT="4.3"
FROM ghcr.io/rocker-org/devcontainer/tidyverse:${VARIANT}

RUN install2.r --error --skipinstalled -n -1 \
        statip \
        patchwork \
        paletteer \
        here \
        doParallel \
        janitor \
        vip \
        ranger \
        palmerpenguins \
        skimr \
        nnet \
        kernlab \
        plotly \
        factoextra \
        cluster \
        tidymodels \
        markdown \
        ottr \
    && rm -rf /tmp/downloaded_packages \
    && R -q -e 'remotes::install_github("https://github.com/dcomtois/summarytools/tree/0-8-9")'

# Install Python packages
# COPY requirements.txt /tmp/pip-tmp/
# RUN python3 -m pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt