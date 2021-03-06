package ibmcloud.resources.computed.ibm_container_worker_pool
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_container_worker_pool"
}
resources_map[attr]{
    attr := plan.changes_computed_values("ibm_container_worker_pool").resources[_]
}
state_ = ret {
    ret := {res.address: object.get(res.attributes, "state_", null) |
        res := resources_map[_]
        true
     }
}
zones = ret {
    ret := {res.address: object.get(res.attributes, "zones", null) |
        res := resources_map[_]
        true
     }
}
labels = ret {
    ret := {res.address: object.get(res.attributes, "labels", null) |
        res := resources_map[_]
        true
     }
}
region = ret {
    ret := {res.address: object.get(res.attributes, "region", null) |
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

