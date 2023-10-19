package authcognitocheck

violation[{"msg": msg}] {
    # Check if authCognito key exists within any item of defaultActions array
    action := input.spec.forProvider.defaultActions[_]
    _ = action.authCognito
    msg = "The 'authCognito' key should not be used within 'spec.forProvider.defaultActions'."
}
