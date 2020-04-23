FROM cardboardci/ci-core@sha256:def9a55df9839ac8234007d4ccd74040a763e975fad6f052d6a4e64d3e5858c2
USER root

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=1.77

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY provision/install.sh /tmp/install.sh
RUN bash /tmp/install.sh ; sync ; rm /tmp/install.sh

USER cardboardci

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer="CardboardCI"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="cppcheck"
LABEL org.label-schema.version="${version}"
LABEL org.label-schema.build-date="${build_date}"
LABEL org.label-schema.release="CardboardCI version:${version} build-date:${build_date}"
LABEL org.label-schema.vendor="cardboardci"
LABEL org.label-schema.architecture="amd64"
LABEL org.label-schema.summary="C++ linter"
LABEL org.label-schema.description="Static analysis of C/C++ code"
LABEL org.label-schema.url="https://gitlab.com/cardboardci/images/cppcheck"
LABEL org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/cppcheck/releases"
LABEL org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/cppcheck"
LABEL org.label-schema.distribution-scope="public"
LABEL org.label-schema.vcs-type="git"
LABEL org.label-schema.vcs-url="https://gitlab.com/cardboardci/images/cppcheck"
LABEL org.label-schema.vcs-ref="${vcs_ref}"
