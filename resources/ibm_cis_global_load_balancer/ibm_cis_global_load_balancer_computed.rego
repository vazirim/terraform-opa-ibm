package ibmcloud.resources.computed.ibm_cis_global_load_balancer
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_cis_global_load_balancer"
}
resources_map[attr]{
    attr := plan.changes_computed_values("ibm_cis_global_load_balancer").resources[_]
}
created_on = ret {
    ret := {res.address: object.get(res.attributes, "created_on", null) |
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
glb_id = ret {
    ret := {res.address: object.get(res.attributes, "glb_id", null) |
        res := resources_map[_]
        true
     }
}

