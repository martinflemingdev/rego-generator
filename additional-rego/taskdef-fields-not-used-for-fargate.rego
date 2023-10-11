package containerdefinitioncheck

# List of prohibited top-level keys
prohibited_keys = [
    "devices",
    "disableNetworking",
    "dnsSearchDomains",
    "dnsServers",
    "dockerSecurityOptions",
    "dockerVolumeConfiguration",
    "extraHosts",
    "gpu",
    "host",
    "hostname",
    "links",
    "placementConstraints",
    "privileged",
    "sharedMemorySize"
]

# List of prohibited nested keys within linuxParameters
prohibited_linux_parameters_keys = [
    "tmpfs"
]

violation[{"msg": msg}] {
    container := input.spec.fargate.containerDefinitions[_]
    prohibited_key := prohibited_keys[_]
    container[prohibited_key]
    msg := sprintf("Prohibited key '%v' found in container definition.", [prohibited_key])
}

violation[{"msg": msg}] {
    container := input.spec.fargate.containerDefinitions[_]
    linux_parameters_key := prohibited_linux_parameters_keys[_]
    container.linuxParameters[linux_parameters_key]
    msg := sprintf("Prohibited key 'linuxParameters.%v' found in container definition.", [linux_parameters_key])
}
