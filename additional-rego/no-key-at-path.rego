package placementcheck

violation[{"msg": msg}] {
    # Check if placementConstraints key exists within taskDefinition
    _ = input.spec.fargate.taskDefinition.placementConstraints
    msg = "The 'placementConstraints' key should not be used within 'spec.fargate.taskDefinition'."
}
