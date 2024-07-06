package cg.policy_test

import data.cg.policy.allow
import rego.v1

test_allow_if_admin if {
	allow with input as {
		"user": "bob",
		"access": "write",
		"roles": ["admin"],
	}
}

data_mock := {
	"alice": [
		"read",
		"write",
	],
	"bob": ["read"],
}

test_allow_if_user_alice if {
	allow with input as {
		"user": "alice",
		"access": "write",
	}
		with data.cg_acl as data_mock
}
