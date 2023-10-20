package subitemkeycheck

# Define the prohibited set of values
prohibited_values = {1, 2, 3}

violation[{"msg": msg}] {
    # Navigate through the nested structure
    item := input.spec.forProvider.myArray[_].myObject.subkey.subArray[_]
    
    # Check if subItemKey is in the prohibited set of values
    prohibited_values[item.subItemKey]
    msg = sprintf("The 'subItemKey' value '%v' is not allowed.", [item.subItemKey])
}
