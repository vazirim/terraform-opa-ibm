package ibmcloud.resources.after.ibm_iam_user_settings
import data.ibmcloud.tfplan as plan
# fetches the list of resource's attributes map.
resource_name_ = ret {
    ret := "ibm_iam_user_settings"
}
resources_map[attr]{
    attr := plan.changes_after_values("ibm_iam_user_settings").resources[_]
}
allowed_ip_addresses = ret {
    ret := {res.address: object.get(res.attributes, "allowed_ip_addresses", null) |
        res := resources_map[_]
        true
     }
}
iam_id = ret {
    ret := {res.address: object.get(res.attributes, "iam_id", null) |
        res := resources_map[_]
        true
     }
}

