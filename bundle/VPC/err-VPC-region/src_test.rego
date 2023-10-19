package regioncheck

# Test for invalid region
test_region_invalid {
    count(violation) > 0 with input as {
        "apiVersion": "ec2.aws.crossplane.io/v1beta1",
        "kind": "VPC",
        "metadata": {
            "name": "sample-vpc-valid"
        },
        "spec": {
            "forProvider": {
                "cidrBlock": "10.0.0.0/16",
                "enableDnsHostNames": true,
                "enableDnsSupport": true,
                "instanceTenancy": "default",
                "region": "INVALID REGION"
            },
            "providerConfigRef": {
                "name": "example"
            }
        }
    }
}

# Test for valid region
test_valid_region {
    count(violation) == 0 with input as {
        "apiVersion": "ec2.aws.crossplane.io/v1beta1",
        "kind": "VPC",
        "metadata": {
            "name": "sample-vpc-valid"
        },
        "spec": {
            "forProvider": {
                "cidrBlock": "10.0.0.0/16",
                "enableDnsHostNames": true,
                "enableDnsSupport": true,
                "instanceTenancy": "default",
                "region": "us-east-1"
            },
            "providerConfigRef": {
                "name": "example"
            }
        }
    }
}
