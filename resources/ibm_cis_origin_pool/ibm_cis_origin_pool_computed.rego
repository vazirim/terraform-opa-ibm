package ibmcloud.resources.computed.ibm_cis_origin_pool
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_cis_origin_pool"
}
resources_map[attr]{
    attr := plan.changes_computed_values("ibm_cis_origin_pool").resources[_]
}
health = ret {
    ret := {res.address: object.get(res.attributes, "health", null) |
        res := resources_map[_]
        true
     }
}
healthy = ret {
    ret := {res.address: object.get(res.attributes, "healthy", null) |
        res := resources_map[_]
        true
     }
}
created_on = ret {
    ret := {res.address: object.get(res.attributes, "created_on", null) |
        res := resources_map[_]
        true
     }
}
pool_id = ret {
    ret := {res.address: object.get(res.attributes, "pool_id", null) |
        res := resources_map[_]
        true
     }
}
modified_on = ret {
    ret := {res.address: object.get(res.attributes, "modified_on", null) |
        res := resources_map[_]
        true
     }
}

