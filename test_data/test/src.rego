package cpumemorycheck

# Define valid combinations
valid_cpu_memory = {
    "256": ["512", "1GB", "2GB"],
    "512": ["512", "1GB", "2GB"]
}

violation[{"msg": msg}] {
    cpu := input.spec.fargate.taskDefinition.cpu
    memory := input.spec.fargate.taskDefinition.memory
    not valid_cpu_for_memory(cpu, memory)
    msg := sprintf("Invalid CPU and Memory combination: CPU: %v, Memory: %v", [cpu, memory])
}

valid_cpu_for_memory(cpu, memory) {
    valid_memories := valid_cpu_memory[cpu]
    valid_memories[_] == memory
}
