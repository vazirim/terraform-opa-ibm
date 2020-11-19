package ibmcloud.resources.planned.ibm_pi_key
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name = ret {
    ret := "ibm_pi_key"
}
resources_map[attr]{
    attr := plan.planned_values("ibm_pi_key").resources[_]
}
pi_creation_date = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "pi_creation_date", null) |
        res := resources_map[_]
        true
     }
}
pi_cloud_instance_id = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "pi_cloud_instance_id", null) |
        res := resources_map[_]
        true
     }
}
pi_key_name = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "pi_key_name", null) |
        res := resources_map[_]
        true
     }
}
pi_ssh_key = ret {
    ret := {concat(".", [res.type, res.name]): object.get(res.attributes, "pi_ssh_key", null) |
        res := resources_map[_]
        true
     }
}

