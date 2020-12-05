package ibmcloud.resources.computed.ibm_is_lb
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_is_lb"
}
resources_map[attr]{
    attr := plan.changes_computed_values("ibm_is_lb").resources[_]
}
resource_name = ret {
    ret := {res.address: object.get(res.attributes, "resource_name", null) |
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
resource_group = ret {
    ret := {res.address: object.get(res.attributes, "resource_group", null) |
        res := resources_map[_]
        true
     }
}
hostname = ret {
    ret := {res.address: object.get(res.attributes, "hostname", null) |
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
tags = ret {
    ret := {res.address: object.get(res.attributes, "tags", null) |
        res := resources_map[_]
        true
     }
}
private_ips = ret {
    ret := {res.address: object.get(res.attributes, "private_ips", null) |
        res := resources_map[_]
        true
     }
}
profile = ret {
    ret := {res.address: object.get(res.attributes, "profile", null) |
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
operating_status = ret {
    ret := {res.address: object.get(res.attributes, "operating_status", null) |
        res := resources_map[_]
        true
     }
}
public_ips = ret {
    ret := {res.address: object.get(res.attributes, "public_ips", null) |
        res := resources_map[_]
        true
     }
}
