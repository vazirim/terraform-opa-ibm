package ibmcloud.resources.prior.ibm_is_subnet
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name = ret {
    ret := "ibm_is_subnet"
}
resources_map[attr]{
    attr := plan.prior_state_values("ibm_is_subnet").resources[_]
}
identifier = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "identifier", null) |
        res := resources_map[_]
        true
     }
}

