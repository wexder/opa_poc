upload-data:
	curl -X PUT 'http://localhost:8181/v1/data/cg_acl' --data "@opa/data/acl.json" -H 'Content-Type: application/json'

upload-policy:
	curl -X PUT 'http://localhost:8181/v1/policies/cg_acl' --data-binary "@opa/policies/acl.rego"

test-allow:
	curl -X POST 'http://localhost:8181/v1/data/cg/policy/allow' --data "@curl/query-input-allow.json" -H 'Content-Type: application/json' | jq

test-deny:
	curl -X POST 'http://localhost:8181/v1/data/cg/policy/allow' --data "@curl/query-input-deny.json" -H 'Content-Type: application/json' | jq
	
test-admin:
	curl -X POST 'http://localhost:8181/v1/data/cg/policy/allow' --data "@curl/query-input-admin.json" -H 'Content-Type: application/json' | jq

test-opice:
	curl -X POST 'http://localhost:8181/v1/data/cg/policy/allow' --data "@curl/query-input-opice.json" -H 'Content-Type: application/json' | jq

upload-all: upload-data upload-policy

test-all: test-allow test-deny test-admin test-opice

all: upload-all test-all
