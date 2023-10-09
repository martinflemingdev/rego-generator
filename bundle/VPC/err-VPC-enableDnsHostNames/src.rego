# METADATA
# custom:
#   annotations:
#     "argocd.argoproj.io/sync-options": "SkipDryRunOnMissingResource=true"
#     "argocd.argoproj.io/sync-wave": "1"
#   matchers:
#     kinds:
#     - kinds:
#       - VPC
package dnscheck

violation[{"msg": msg}] {
    input.spec.forProvider.enableDnsHostNames == false
    msg := "Field 'spec.forProvider.enableDnsHostNames' should be set to true."
}
