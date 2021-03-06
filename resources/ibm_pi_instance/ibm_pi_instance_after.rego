package ibmcloud.resources.after.ibm_pi_instance
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_pi_instance"
}
resources_map[attr]{
    attr := plan.changes_after_values("ibm_pi_instance").resources[_]
}
pi_virtual_cores_assigned = ret {
    ret := {res.address: object.get(res.attributes, "pi_virtual_cores_assigned", null) |
        res := resources_map[_]
        true
     }
}
pi_cloud_instance_id = ret {
    ret := {res.address: object.get(res.attributes, "pi_cloud_instance_id", null) |
        res := resources_map[_]
        true
     }
}
pi_volume_ids = ret {
    ret := {res.address: object.get(res.attributes, "pi_volume_ids", null) |
        res := resources_map[_]
        true
     }
}
pi_replication_scheme = ret {
    ret := {res.address: object.get(res.attributes, "pi_replication_scheme", null) |
        res := resources_map[_]
        true
     }
}
pi_pin_policy = ret {
    ret := {res.address: object.get(res.attributes, "pi_pin_policy", null) |
        res := resources_map[_]
        true
     }
}
pi_network_ids = ret {
    ret := {res.address: object.get(res.attributes, "pi_network_ids", null) |
        res := resources_map[_]
        true
     }
}
pi_instance_name = ret {
    ret := {res.address: object.get(res.attributes, "pi_instance_name", null) |
        res := resources_map[_]
        true
     }
}
pi_replicants = ret {
    ret := {res.address: object.get(res.attributes, "pi_replicants", null) |
        res := resources_map[_]
        true
     }
}
pi_health_status = ret {
    ret := {res.address: object.get(res.attributes, "pi_health_status", null) |
        res := resources_map[_]
        true
     }
}
pi_replication_policy = ret {
    ret := {res.address: object.get(res.attributes, "pi_replication_policy", null) |
        res := resources_map[_]
        true
     }
}
reboot_for_resource_change = ret {
    ret := {res.address: object.get(res.attributes, "reboot_for_resource_change", null) |
        res := resources_map[_]
        true
     }
}
pi_user_data = ret {
    ret := {res.address: object.get(res.attributes, "pi_user_data", null) |
        res := resources_map[_]
        true
     }
}
pi_image_id = ret {
    ret := {res.address: object.get(res.attributes, "pi_image_id", null) |
        res := resources_map[_]
        true
     }
}
pi_sys_type = ret {
    ret := {res.address: object.get(res.attributes, "pi_sys_type", null) |
        res := resources_map[_]
        true
     }
}
pi_memory = ret {
    ret := {res.address: object.get(res.attributes, "pi_memory", null) |
        res := resources_map[_]
        true
     }
}
pi_processors = ret {
    ret := {res.address: object.get(res.attributes, "pi_processors", null) |
        res := resources_map[_]
        true
     }
}
pi_proc_type = ret {
    ret := {res.address: object.get(res.attributes, "pi_proc_type", null) |
        res := resources_map[_]
        true
     }
}
pi_key_pair_name = ret {
    ret := {res.address: object.get(res.attributes, "pi_key_pair_name", null) |
        res := resources_map[_]
        true
     }
}

