package cpumemorycheck
import future.keywords

test_cpu if {
    count(violation) > 0 with input as {
        "spec": {
            "fargate": {
                "taskDefinition": {
                    "cpu":"512",
                    "memory":"512"
                }
            }
        }

    }
}