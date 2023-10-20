package subitemkeycheck

# Define the allowed set of values
allowed_values = {1, 2, 3}

violation[{"msg": msg}] {
    # Navigate through the nested structure
    item := input.spec.forProvider.myArray[_].myObject.subkey.subArray[_]
    
    # Check if subItemKey is not in the allowed set of values
    not allowed_values[item.subItemKey]
    msg = sprintf("The 'subItemKey' value '%v' is not in the allowed set.", [item.subItemKey])
}
