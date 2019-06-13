FROM alpine:3.8
COPY rootfs/ /

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "cppcheck" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "C++ linter" \
    org.label-schema.description = "Static analysis of C/C++ code" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/cppcheck" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/cppcheck/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/cppcheck" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/cppcheck" \
    org.label-schema.vcs-ref = "${vcs_ref}" \