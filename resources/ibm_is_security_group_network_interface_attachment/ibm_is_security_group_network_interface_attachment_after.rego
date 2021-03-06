package ibmcloud.resources.after.ibm_is_security_group_network_interface_attachment
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_is_security_group_network_interface_attachment"
}
resources_map[attr]{
    attr := plan.changes_after_values("ibm_is_security_group_network_interface_attachment").resources[_]
}
security_group = ret {
    ret := {res.address: object.get(res.attributes, "security_group", null) |
        res := resources_map[_]
        true
     }
}
network_interface = ret {
    ret := {res.address: object.get(res.attributes, "network_interface", null) |
        res := resources_map[_]
        true
     }
}

