package ibmcloud.resources.prior.ibm_container_vpc_cluster
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_container_vpc_cluster"
}
resources_map[attr]{
    attr := plan.prior_state_values("ibm_container_vpc_cluster").resources[_]
}
alb_type = ret {
    ret := {res.address: object.get(res.attributes, "alb_type", null) |
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
cluster_name_id = ret {
    ret := {res.address: object.get(res.attributes, "cluster_name_id", null) |
        res := resources_map[_]
        true
     }
}
resource_group_id = ret {
    ret := {res.address: object.get(res.attributes, "resource_group_id", null) |
        res := resources_map[_]
        true
     }
}

