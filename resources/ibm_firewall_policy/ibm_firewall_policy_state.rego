package ibmcloud.resources.state.ibm_firewall_policy
import data.ibmcloud.state as state
# fetches the list of resource's attributes map.
resource_name = ret {
    ret := "ibm_firewall_policy"
}

resources_map[attr]{
    attr := state.get_resources("ibm_firewall_policy", "managed").resources[_]
}
firewall_id = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "firewall_id", null) |
        res := resources_map[_]
        true
     }
}
rules = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "rules", null) |
        res := resources_map[_]
        true
     }
}
tags = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "tags", null) |
        res := resources_map[_]
        true
     }
}
