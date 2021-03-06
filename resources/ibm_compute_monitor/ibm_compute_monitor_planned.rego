package ibmcloud.resources.planned.ibm_compute_monitor
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_compute_monitor"
}
resources_map[attr]{
    attr := plan.planned_values("ibm_compute_monitor").resources[_]
}
guest_id = ret {
    ret := {res.address: object.get(res.attributes, "guest_id", null) |
        res := resources_map[_]
        true
     }
}
ip_address = ret {
    ret := {res.address: object.get(res.attributes, "ip_address", null) |
        res := resources_map[_]
        true
     }
}
query_type_id = ret {
    ret := {res.address: object.get(res.attributes, "query_type_id", null) |
        res := resources_map[_]
        true
     }
}
response_action_id = ret {
    ret := {res.address: object.get(res.attributes, "response_action_id", null) |
        res := resources_map[_]
        true
     }
}
wait_cycles = ret {
    ret := {res.address: object.get(res.attributes, "wait_cycles", null) |
        res := resources_map[_]
        true
     }
}
notified_users = ret {
    ret := {res.address: object.get(res.attributes, "notified_users", null) |
        res := resources_map[_]
        true
     }
}
tags = ret {
    ret := {res.address: object.get(res.attributes, "tags", null) |
        res := resources_map[_]
        true
     }
}

