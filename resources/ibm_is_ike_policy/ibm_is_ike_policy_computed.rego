package ibmcloud.resources.computed.ibm_is_ike_policy
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_is_ike_policy"
}
resources_map[attr]{
    attr := plan.changes_computed_values("ibm_is_ike_policy").resources[_]
}
negotiation_mode = ret {
    ret := {res.address: object.get(res.attributes, "negotiation_mode", null) |
        res := resources_map[_]
        true
     }
}
resource_controller_url = ret {
    ret := {res.address: object.get(res.attributes, "resource_controller_url", null) |
        res := resources_map[_]
        true
     }
}
resource_group = ret {
    ret := {res.address: object.get(res.attributes, "resource_group", null) |
        res := resources_map[_]
        true
     }
}
href = ret {
    ret := {res.address: object.get(res.attributes, "href", null) |
        res := resources_map[_]
        true
     }
}
vpn_connections = ret {
    ret := {res.address: object.get(res.attributes, "vpn_connections", null) |
        res := resources_map[_]
        true
     }
}
resource_name = ret {
    ret := {res.address: object.get(res.attributes, "resource_name", null) |
        res := resources_map[_]
        true
     }
}
resource_group_name = ret {
    ret := {res.address: object.get(res.attributes, "resource_group_name", null) |
        res := resources_map[_]
        true
     }
}

