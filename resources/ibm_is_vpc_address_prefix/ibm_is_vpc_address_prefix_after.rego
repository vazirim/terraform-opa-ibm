package ibmcloud.resources.after.ibm_is_vpc_address_prefix
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_is_vpc_address_prefix"
}
resources_map[attr]{
    attr := plan.changes_after_values("ibm_is_vpc_address_prefix").resources[_]
}
vpc = ret {
    ret := {res.address: object.get(res.attributes, "vpc", null) |
        res := resources_map[_]
        true
     }
}
name = ret {
    ret := {res.address: object.get(res.attributes, "name", null) |
        res := resources_map[_]
        true
     }
}
zone = ret {
    ret := {res.address: object.get(res.attributes, "zone", null) |
        res := resources_map[_]
        true
     }
}
cidr = ret {
    ret := {res.address: object.get(res.attributes, "cidr", null) |
        res := resources_map[_]
        true
     }
}
