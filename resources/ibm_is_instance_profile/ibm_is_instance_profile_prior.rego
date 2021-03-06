package ibmcloud.resources.prior.ibm_is_instance_profile
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_is_instance_profile"
}
resources_map[attr]{
    attr := plan.prior_state_values("ibm_is_instance_profile").resources[_]
}
name = ret {
    ret := {res.address: object.get(res.attributes, "name", null) |
        res := resources_map[_]
        true
     }
}

