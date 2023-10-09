# METADATA
# title: DNS Check for enableDnsHostNames
# description: >-
#   This policy ensures that the 'spec.forProvider.enableDnsHostNames' field is set to true.
# custom:
#   enforcement: deny

package dnscheck

violation[{"msg": msg}] {
    input.spec.forProvider.enableDnsHostNames == false
    msg := "Field 'spec.forProvider.enableDnsHostNames' should be set to true."
}
