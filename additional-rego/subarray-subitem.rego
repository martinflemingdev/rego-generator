# check that spec.forProvider.myArray[].myObject.subkey.subArray[].subItemKey == False

package subitemkeycheck

violation[{"msg": msg}] {
    # Navigate through the nested structure
    item := input.spec.forProvider.myArray[_].myObject.subkey.subArray[_]
    
    # Check if subItemKey is not set to False
    item.subItemKey != false
    msg = "The 'subItemKey' should be set to 'False'."
}

# In this policy:

# The violation rule iterates over each item in the spec.forProvider.myArray array and then further iterates over each item in the nested subArray.
# If the subItemKey is found to be not set to False in any of those nested items, a violation message is produced.