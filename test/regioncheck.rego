package regioncheck

import future.keywords.in

# List of allowed regions
allowed_regions = {"us-east-1", "ap-southeast-2"}

violation[{"msg": msg}] {
    not input.spec.forProvider.region in allowed_regions
    msg := "Invalid region"
}
