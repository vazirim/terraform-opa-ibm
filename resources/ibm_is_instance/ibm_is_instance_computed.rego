package ibmcloud.resources.computed.ibm_is_instance
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_is_instance"
}
resources_map[attr]{
    attr := plan.changes_computed_values("ibm_is_instance").resources[_]
}
memory = ret {
    ret := {res.address: object.get(res.attributes, "memory", null) |
        res := resources_map[_]
        true
     }
}
resource_group_name = ret {
    ret := {res.address: object.get(res.attributes, "resource_group_name", null) |
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
resource_name = ret {
    ret := {res.address: object.get(res.attributes, "resource_name", null) |
        res := resources_map[_]
        true
     }
}
boot_volume = ret {
    ret := {res.address: object.get(res.attributes, "boot_volume", null) |
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
resource_crn = ret {
    ret := {res.address: object.get(res.attributes, "resource_crn", null) |
        res := resources_map[_]
        true
     }
}
resource_status = ret {
    ret := {res.address: object.get(res.attributes, "resource_status", null) |
        res := resources_map[_]
        true
     }
}
volume_attachments = ret {
    ret := {res.address: object.get(res.attributes, "volume_attachments", null) |
        res := resources_map[_]
        true
     }
}
resource_group = ret {
    ret := {res.address: object.get(res.attributes, "resource_group", null) |
        res := resources_map[_]
        true
     }
}
vcpu = ret {
    ret := {res.address: object.get(res.attributes, "vcpu", null) |
        res := resources_map[_]
        true
     }
}
gpu = ret {
    ret := {res.address: object.get(res.attributes, "gpu", null) |
        res := resources_map[_]
        true
     }
}
status = ret {
    ret := {res.address: object.get(res.attributes, "status", null) |
        res := resources_map[_]
        true
     }
}

