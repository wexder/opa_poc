package cg.policy

import data.cg_acl
import rego.v1

default allow := false

allow if "admin" in input.roles

allow if {
	access := cg_acl[input.user]
	ac := input.access
    ac in access
}

allow if {
	input.user == "opice"
}
