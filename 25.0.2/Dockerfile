ARG VERSION
FROM quay.io/keycloak/keycloak:${VERSION} as builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=postgres
#ENV KC_LOG_LEVEL=debug

WORKDIR /opt/keycloak
ADD --chown=keycloak:keycloak ./archive/maine-sbm.jar /opt/keycloak/providers/maine-sbm.jar
RUN /opt/keycloak/bin/kc.sh build --features=admin-fine-grained-authz

FROM quay.io/keycloak/keycloak:${VERSION}
#ENV KC_LOG_LEVEL=debug
ENV JAVA_OPTS_APPEND="-Dquarkus.transaction-manager.default-transaction-timeout=3600 -Dkeycloak.migration.batch-enabled=true -Dkeycloak.migration.batch-size=1000"
COPY --from=builder /opt/keycloak/ /opt/keycloak/
