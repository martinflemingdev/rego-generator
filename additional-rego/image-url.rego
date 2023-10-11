package ecrimagecheck

# Regular expression pattern to match AWS ECR image format
ecr_pattern = "^\\d{12}\\.dkr\\.ecr\\.[a-z0-9-]+\\.amazonaws\\.com/[a-zA-Z0-9-_]+:[a-zA-Z0-9-_]+$"

violation[{"msg": msg}] {
    container := input.spec.fargate.containerDefinitions[_]
    not valid_ecr_image(container.image)
    msg := sprintf("Invalid ECR image format for container image: %v", [container.image])
}

valid_ecr_image(image) {
    re_match(ecr_pattern, image)
}
