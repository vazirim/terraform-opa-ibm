package ibmcloud.resources.after.ibm_is_lb_pool_member
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_is_lb_pool_member"
}
resources_map[attr]{
    attr := plan.changes_after_values("ibm_is_lb_pool_member").resources[_]
}
pool = ret {
    ret := {res.address: object.get(res.attributes, "pool", null) |
        res := resources_map[_]
        true
     }
}
weight = ret {
    ret := {res.address: object.get(res.attributes, "weight", null) |
        res := resources_map[_]
        true
     }
}
target_id = ret {
    ret := {res.address: object.get(res.attributes, "target_id", null) |
        res := resources_map[_]
        true
     }
}
lb = ret {
    ret := {res.address: object.get(res.attributes, "lb", null) |
        res := resources_map[_]
        true
     }
}
port = ret {
    ret := {res.address: object.get(res.attributes, "port", null) |
        res := resources_map[_]
        true
     }
}
target_address = ret {
    ret := {res.address: object.get(res.attributes, "target_address", null) |
        res := resources_map[_]
        true
     }
}

