FROM alpine:3.12.0 as fetcher

ARG KUSTOMIZE_VERSION=v3.8.1

ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_darwin_amd64.tar.gz /usr/local/bin/kustomize

RUN chmod +x /usr/local/bin/kustomize

FROM alpine:3.12.0

WORKDIR /workdir

ENTRYPOINT [ "/usr/local/bin/kustomize" ]

COPY --from=fetcher /usr/local/bin/kustomize /usr/local/bin/kustomize
