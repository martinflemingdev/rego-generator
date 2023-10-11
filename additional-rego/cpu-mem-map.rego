package cpumemorycheck

# Define valid combinations
valid_cpu_memory = {
    "256": ["0.5GB", "1GB", "2GB"],
    # ... add other combinations based on the AWS documentation
}

violation[{"msg": msg}] {
    cpu := input.spec.forProvider.fargate.taskDefinition.cpu
    memory := input.spec.forProvider.fargate.taskDefinition.memory
    not valid_cpu_for_memory(cpu, memory)
    msg := sprintf("Invalid CPU and Memory combination: CPU: %v, Memory: %v", [cpu, memory])
}

valid_cpu_for_memory(cpu, memory) {
    valid_memories := valid_cpu_memory[cpu]
    valid_memories[_] == memory
}
