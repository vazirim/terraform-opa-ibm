package ibmcloud.resources.after.ibm_kms_key
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_kms_key"
}
resources_map[attr]{
    attr := plan.changes_after_values("ibm_kms_key").resources[_]
}
instance_id = ret {
    ret := {res.address: object.get(res.attributes, "instance_id", null) |
        res := resources_map[_]
        true
     }
}
standard_key = ret {
    ret := {res.address: object.get(res.attributes, "standard_key", null) |
        res := resources_map[_]
        true
     }
}
expiration_date = ret {
    ret := {res.address: object.get(res.attributes, "expiration_date", null) |
        res := resources_map[_]
        true
     }
}
key_name = ret {
    ret := {res.address: object.get(res.attributes, "key_name", null) |
        res := resources_map[_]
        true
     }
}
endpoint_type = ret {
    ret := {res.address: object.get(res.attributes, "endpoint_type", null) |
        res := resources_map[_]
        true
     }
}
force_delete = ret {
    ret := {res.address: object.get(res.attributes, "force_delete", null) |
        res := resources_map[_]
        true
     }
}
policies = ret {
    ret := {res.address: object.get(res.attributes, "policies", null) |
        res := resources_map[_]
        true
     }
}
payload = ret {
    ret := {res.address: object.get(res.attributes, "payload", null) |
        res := resources_map[_]
        true
     }
}
encrypted_nonce = ret {
    ret := {res.address: object.get(res.attributes, "encrypted_nonce", null) |
        res := resources_map[_]
        true
     }
}
iv_value = ret {
    ret := {res.address: object.get(res.attributes, "iv_value", null) |
        res := resources_map[_]
        true
     }
}
