package ibmcloud.resources.after.ibm_lbaas_health_monitor
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_lbaas_health_monitor"
}
resources_map[attr]{
    attr := plan.changes_after_values("ibm_lbaas_health_monitor").resources[_]
}
protocol = ret {
    ret := {res.address: object.get(res.attributes, "protocol", null) |
        res := resources_map[_]
        true
     }
}
port = ret {
    ret := {res.address: object.get(res.attributes, "port", null) |
        res := resources_map[_]
        true
     }
}
interval = ret {
    ret := {res.address: object.get(res.attributes, "interval", null) |
        res := resources_map[_]
        true
     }
}
max_retries = ret {
    ret := {res.address: object.get(res.attributes, "max_retries", null) |
        res := resources_map[_]
        true
     }
}
timeout = ret {
    ret := {res.address: object.get(res.attributes, "timeout", null) |
        res := resources_map[_]
        true
     }
}
url_path = ret {
    ret := {res.address: object.get(res.attributes, "url_path", null) |
        res := resources_map[_]
        true
     }
}
monitor_id = ret {
    ret := {res.address: object.get(res.attributes, "monitor_id", null) |
        res := resources_map[_]
        true
     }
}
lbaas_id = ret {
    ret := {res.address: object.get(res.attributes, "lbaas_id", null) |
        res := resources_map[_]
        true
     }
}
