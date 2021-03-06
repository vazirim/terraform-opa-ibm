package ibmcloud.resources.after.ibm_tg_connection
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_tg_connection"
}
resources_map[attr]{
    attr := plan.changes_after_values("ibm_tg_connection").resources[_]
}
name = ret {
    ret := {res.address: object.get(res.attributes, "name", null) |
        res := resources_map[_]
        true
     }
}
network_id = ret {
    ret := {res.address: object.get(res.attributes, "network_id", null) |
        res := resources_map[_]
        true
     }
}
network_account_id = ret {
    ret := {res.address: object.get(res.attributes, "network_account_id", null) |
        res := resources_map[_]
        true
     }
}
gateway = ret {
    ret := {res.address: object.get(res.attributes, "gateway", null) |
        res := resources_map[_]
        true
     }
}
network_type = ret {
    ret := {res.address: object.get(res.attributes, "network_type", null) |
        res := resources_map[_]
        true
     }
}

