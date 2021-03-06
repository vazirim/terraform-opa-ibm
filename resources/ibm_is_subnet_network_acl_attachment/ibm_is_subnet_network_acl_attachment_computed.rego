package ibmcloud.resources.computed.ibm_is_subnet_network_acl_attachment
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_is_subnet_network_acl_attachment"
}
resources_map[attr]{
    attr := plan.changes_computed_values("ibm_is_subnet_network_acl_attachment").resources[_]
}
name = ret {
    ret := {res.address: object.get(res.attributes, "name", null) |
        res := resources_map[_]
        true
     }
}
vpc = ret {
    ret := {res.address: object.get(res.attributes, "vpc", null) |
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
rules = ret {
    ret := {res.address: object.get(res.attributes, "rules", null) |
        res := resources_map[_]
        true
     }
}

