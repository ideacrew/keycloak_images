require "sbom_on_rails"

component_def = SbomOnRails::Sbom::ComponentDefinition.new(
  "keycloak",
  nil,
  "25.0.2"
)

manifest = SbomOnRails::Manifest::ManifestFile.new(
  File.join(
    File.dirname(__FILE__),
    "manifest.yaml"
  )
)

puts manifest.execute(component_def)
