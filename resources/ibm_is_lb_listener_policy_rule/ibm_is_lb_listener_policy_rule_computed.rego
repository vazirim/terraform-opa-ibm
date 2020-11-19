package ibmcloud.resources.computed.ibm_is_lb_listener_policy_rule
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name = ret {
    ret := "ibm_is_lb_listener_policy_rule"
}
resources_map[attr]{
    attr := plan.changes_computed_values("ibm_is_lb_listener_policy_rule").resources[_]
}
provisioning_status = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "provisioning_status", null) |
        res := resources_map[_]
        true
     }
}
rule = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "rule", null) |
        res := resources_map[_]
        true
     }
}
related_crn = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "related_crn", null) |
        res := resources_map[_]
        true
     }
}

