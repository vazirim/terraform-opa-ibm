package ibmcloud.tfplan

import data as tfplan

# lists all the variables from variable section
variables = vars{
    some k
    vars := { k : v |
        v := tfplan.varibales[k].value
        true
    }
}

# returns the list of module
#  - module name
#  - resources in the module
#    - resource_name
#    - resource_type

# Example output shown below:
# [
#   {
#     "module_name": "root_module",
#     "resources_list": [
#       {
#         "resource_name": "test",
#         "resource_type": "ibm_is_vpc"
#       }
#     ]
#   }
# ]

module_calls[msg] {
  [_, value] := walk(tfplan["configuration"])
  msg = value.module_calls
}

root_module_resources = ret {
    ret := [{"module_name": "root_module", "resources_list": get_resources_list_info(tfplan.configuration["root_module"]["resources"])}]
}

modules = mods {
    some i, j
    other_modules := [ {"module_name": j, "resources_list": get_resources_list_info(val.module.resources) } |
         val := module_calls[i][j]
         true
    ]
    mods := array.concat(other_modules, root_module_resources)
}

# returns the configuration info
# - provider_config:
#   - name: provider_name
#     values:
#       attribute1: value
#     modules:
#       name1: value
#     resources:
#       - name: resource_name
#         type: resource_type
#         attributes: 
#           - attrbute1: value
#             attrbute2: value

# Example output:
#
# {
#   "modules": [
#     {
#       "name": "root_module",
#       "resources": [
#         {
#           "attributes": {
#             "classic_access": true,
#             "name": [
#               "tes-name"
#             ],
#             "tags": [
#               "test",
#               "my_vpc"
#             ]
#           },
#           "resource_name": "vpc",
#           "resource_type": "ibm_is_vpc"
#         }
#       ]
#     }
#   ],
#   "provider_config": [
#     {
#       "name": "ibm",
#       "values": {
#         "ibmcloud_timeout": 60,
#         "region": [
#           "us-south"
#         ]
#       }
#     }
#   ]
# }

get_root_module_config = root_module_resource_config {
    x := object.get(tfplan["configuration"]["root_module"], "resources", [])
    root_module_resource_config := [{"name": "root_module", "resources": get_resources_config(x) }]
}

get_modules_config =  modules_config {
    some i, j
    other_modules_config := [ {"name": j, "resources": get_resources_config(val.module.resources) } |
         val := module_calls[i][j]
         true
    ]
    root_modules := get_root_module_config
    modules_config := array.concat(other_modules_config, root_modules)
}

plan_configuration = config {
    config := { 
        "provider_config": get_provider_config(tfplan["configuration"].provider_config),
        "modules": get_modules_config
    }
}

# returns the provider config
# - provider_config
#   - name: provider_name
#     attributes:
#       attribute: value
#
#Example Output
#
# {
#   "provider_config": [
#     {
#       "name": "ibm",
#       "values": {
#         "ibmcloud_timeout": 60,
#         "region": [
#           "us-south"
#         ]
#       }
#     }
#   ]
# }

provider_config = provider {
    provider := {"provider_config": get_provider_config(tfplan.configuration.provider_config)} 
}


# returns the terraform version
# - version: value
#
# Example output:
#
# {
#   "version": "0.12.21-dev"
# }
version = terraform_version {
    terraform_version := {"version": tfplan["terraform_version"]}
}

# returns the list of resource and attribute values "before" apply
# - resources 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: value
# 
#Example output:
#
# {
#   "resources": [
#     {
#       "attributes": null,
#       "name": "vpc",
#       "provider": "ibm",
#       "type": "ibm_is_vpc"
#     }
#   ]
# }
before = resource_changes_before {
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "attributes": r.change.before} |
        r := tfplan["resource_changes"][_]
        true
    ]
    resource_changes_before := {"resources": vals}
}

# returns the list of resource and attribute values "after" apply
# - resources 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: value
#
#Example Output:
#
# {
#   "resources": [
#     {
#       "attributes": {
#         "address_prefix_management": "auto",
#         "classic_access": true,
#         "is_default": null,
#         "name": "tes-name",
#         "resource_group": "dae36a8eba174edd9ca57b531d50495e",
#         "tags": [
#           "my_vpc",
#           "test"
#         ],
#         "timeouts": null
#       },
#       "name": "vpc",
#       "provider": "ibm",
#       "type": "ibm_is_vpc"
#     }
#   ]
# }
after = resource_changes_after {
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "attributes": r.change.after} |
        r := tfplan["resource_changes"][_]
        true
    ]
    resource_changes_after := {"resources": vals}
}

# returns the list of resource and computed attribute 
# - resources 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: boolean
#
#Example Output:
#
# {
#   "resources": [
#     {
#       "attributes": {
#         "crn": true,
#         "cse_source_addresses": true,
#         "default_network_acl": true,
#         "default_security_group": true,
#         "id": true,
#         "resource_controller_url": true,
#         "resource_crn": true,
#         "resource_group_name": true,
#         "resource_name": true,
#         "resource_status": true,
#         "status": true,
#         "subnets": true,
#         "tags": [
#           false,
#           false
#         ]
#       },
#       "name": "vpc",
#       "provider": "ibm",
#       "type": "ibm_is_vpc"
#     }
#   ]
# }
computed = resource_changes_after_unknown {
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "attributes": r.change.after_unknown} |
        r := tfplan["resource_changes"][_]
        true
    ]
    resource_changes_after_unknown := {"resources": vals}
}

# returns the planned final state
# - resources 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: value
# 
#Example Output:
#
# {
#   "resources": [
#     {
#       "attributes": {
#         "address_prefix_management": "auto",
#         "classic_access": true,
#         "is_default": null,
#         "name": "tes-name",
#         "resource_group": "dae36a8eba174edd9ca57b531d50495e",
#         "tags": [
#           "my_vpc",
#           "test"
#         ],
#         "timeouts": null
#       },
#       "name": "vpc",
#       "provider": "ibm",
#       "type": "ibm_is_vpc"
#     }
#   ]
# }
planned_resources_list[d] {
    [_, value] := walk(tfplan["planned_values"])
    d = value.resources[_]
}

planned = planned_values {
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "address": r.address, "attributes": r.values} |
        r := planned_resources_list[_]
        true
    ]
    planned_values := {"resources": vals}
}

# returns the list of resources with prior state data
# - resources 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: value
#
#Example Output:
#
# {
#   "resources": [
#     {
#       "attributes": {
#         "id": "dae36a8eba174edd9ca57b531d50495e",
#         "is_default": null,
#         "name": "Default"
#       },
#       "name": "group",
#       "provider": "ibm",
#       "type": "ibm_resource_group"
#     }
#   ]
# }

prior = prior_states {
    some i
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "attributes": r.values} |
        r := tfplan["prior_state"].values[i].resources[_]
        true
    ]
    prior_states := {"resources": vals}
}


# returns the list of newly created resource and attribute values "after" apply
# - resources 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: value
#
#Example Output :
#
# {
#   "resources": [
#     {
#       "attributes": {
#         "address_prefix_management": "auto",
#         "classic_access": true,
#         "is_default": null,
#         "name": "tes-name",
#         "resource_group": "dae36a8eba174edd9ca57b531d50495e",
#         "tags": [
#           "my_vpc",
#           "test"
#         ],
#         "timeouts": null
#       },
#       "name": "vpc",
#       "provider": "ibm",
#       "type": "ibm_is_vpc"
#     }
#   ]
# }
create = resources_added {
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "attributes": r.change.after} |
        r := tfplan["resource_changes"][_]
        r.change.actions[_] == "create"
    ]
    resources_added := {"resources": vals}
}
# returns the list of deleted resource and attribute values "after" apply
# - resource 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: value
delete = resources_deleted {
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "attributes": r.change.after} |
        r := tfplan["resource_changes"][_]
        r.change.actions[_] == "delete"
    ]
    resources_deleted := {"resources": vals}
}

# returns the list of updated resource and attribute values "after" apply
# - resource 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: value
#
#Example output:
#
# {
#   "resources": [
#     {
#       "attributes": {
#         "address_prefix_management": "auto",
#         "classic_access": true,
#         "is_default": null,
#         "name": "tes-name",
#         "resource_group": "dae36a8eba174edd9ca57b531d50495e",
#         "tags": [
#           "my_vpc",
#           "test"
#         ],
#         "timeouts": null
#       },
#       "name": "vpc",
#       "provider": "ibm",
#       "type": "ibm_is_vpc"
#     }
#   ]
# }

update = resources_updated {
     vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "attributes": r.change.after} |
        r := tfplan["resource_changes"][_]
        r.change.actions[_] == "update"
    ]
    resources_updated  := {"resources": vals}
}

# returns the details about a resource (by name)
# - resources 
#   - name: name
#     type: type
#     provider: provider_name
#     before:
#        attribute: value
#     after:
#        attribute: value
#     computed:
#        attribute: value
#
# Example Output:
#
# {
#   "resources": [
#     {
#       "after": {
#         "address_prefix_management": "auto",
#         "classic_access": true,
#         "is_default": null,
#         "name": "tes-name",
#         "resource_group": "dae36a8eba174edd9ca57b531d50495e",
#         "tags": [
#           "my_vpc",
#           "test"
#         ],
#         "timeouts": null
#       },
#       "before": null,
#       "computed": {
#         "crn": true,
#         "cse_source_addresses": true,
#         "default_network_acl": true,
#         "default_security_group": true,
#         "id": true,
#         "resource_controller_url": true,
#         "resource_crn": true,
#         "resource_group_name": true,
#         "resource_name": true,
#         "resource_status": true,
#         "status": true,
#         "subnets": true,
#         "tags": [
#           false,
#           false
#         ]
#       },
#       "name": "vpc",
#       "provider": "ibm",
#       "type": "ibm_is_vpc"
#     }
#   ]
# }
resources(resource_name) = ret {
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "before": r.change.before, "after": r.change.after, "computed": r.change.after_unknown } |
        r := tfplan["resource_changes"][_]
        r.type == resource_name
    ]
    ret := {"resources": vals}
}

# returns the details of the change of a resource (by name)
# - resource 
#   - name: name
#     type: type
#     provider: provider_name
#     change: change_name
#     before:
#        attribute: value
#     after:
#        attribute: value
#     computed:
#        attribute: value
#
# Example Output:
#
# {
#   "resource": {
#     "after": {
#       "address_prefix_management": "auto",
#       "classic_access": true,
#       "is_default": null,
#       "name": "tes-name",
#       "resource_group": "dae36a8eba174edd9ca57b531d50495e",
#       "tags": [
#         "my_vpc",
#         "test"
#       ],
#       "timeouts": null
#     },
#     "before": null,
#     "computed": {
#       "crn": true,
#       "cse_source_addresses": true,
#       "default_network_acl": true,
#       "default_security_group": true,
#       "id": true,
#       "resource_controller_url": true,
#       "resource_crn": true,
#       "resource_group_name": true,
#       "resource_name": true,
#       "resource_status": true,
#       "status": true,
#       "subnets": true,
#       "tags": [
#         false,
#         false
#       ]
#     },
#     "name": "vpc",
#     "provider": "ibm",
#     "type": "ibm_is_vpc"
#   }
# }

change(name) = ret {
    vals := resources(name) 
    ret := { "resource": r | r :=vals.resources[_]; r.type == name}
}

# returns the planned final state of a resource (by name)
# - resource 
#   - name: name
#     type: type
#     provider: provider_name
#     attributes:
#       attribute: value

# Example Output:
#
# {
#   "resources": [
#     {
#       "attributes": {
#         "address_prefix_management": "auto",
#         "classic_access": true,
#         "is_default": null,
#         "name": "tes-name",
#         "resource_group": "dae36a8eba174edd9ca57b531d50495e",
#         "tags": [
#           "my_vpc",
#           "test"
#         ],
#         "timeouts": null
#       },
#       "name": "vpc",
#       "provider": "ibm",
#       "type": "ibm_is_vpc"
#     }
#   ]
# }

get_planned_resources[resource]{
    [_, value] := walk(tfplan["planned_values"]["root_module"])
    resource = value.resources[_]
}

planned_values(resource_name) = resource_planned_values {
    some i
    planned_resources := get_planned_resources
    vals := [{"name": r.name, "type": r.type, "address": r.address, "provider": r.provider_name, "attributes": r.values} |
        r := planned_resources[i]
        r.type == resource_name
    ]
    resource_planned_values := {"resources": vals}
 }

prior_state_values(resource_name) = resource_prior_state_values {
    some i
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "address": r.address, "attributes": r.values} |
        r := tfplan["prior_state"][i].resources[_]
        r.type == resource_name
    ]
    resource_prior_state_values := {"resources": vals}
 }
 
changes_after_values(resource_name) = resource_changes_after_values {
    vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "address": r.address, "attributes": r.change.after_unknown} |
        r := tfplan["resource_changes"][_]
        r.type == resource_name
    ]
    resource_changes_after_values := {"resources": vals}
 }

changes_computed_values(resource_name) = resource_computed_values {
        vals := [{"name": r.name, "type": r.type, "provider": r.provider_name, "address": r.address, "attributes": r.change.after_unknown} |
        r := tfplan["resource_changes"][_]
        r.type == resource_name
    ]
    resource_computed_values := {"resources": vals}
 }

 # Utility Functions
get_value(ref) = ret {
    startswith(ref, "var.")
    ret = tfplan.variables[split(ref, ".")[1]].value
} else = ret {
    ret = ref
}

resolve_references(ref_list) = ret {
     ret := [ get_value(ref) |
        ref := ref_list[_]
        true
    ]
}

get_values(obj) = value{
    value = obj["constant_value"]
} else = value {
    value = resolve_references(obj["references"])
}

complex_expressions(d) = ret{
    is_array(d) == true
    some j, k
    ret := {k : get_values(v) |
                 v := d[j][k]
                 true
                }
}

get_expressions(exp) = val {
    some i
    out1 := {i: complex_expressions(x)  | 
        x := exp[i] 
        true
    }
    some y
    out2 := { y : get_values(value)|
        value := exp[y]
        true
    }
    val := object.union(out2, out1)   
}

get_provider_config(config) = pc {
    some i
    pc := [ {"name": i, "values": get_expressions(expressions) } |
        expressions := config[i].expressions
        true
    ]
}

get_resources_config(resources_list) = resource_config{
    resource_config := [ {"resource_name": r.name , "resource_type": r.type, "attributes": get_expressions(r.expressions) } |
        r := resources_list[_]
        true
    ]
}

get_resources_list_info(resources_list) = resources {
    resources := [ {"resource_name": r.name , "resource_type": r.type } |
        r := resources_list[_]
        true
    ]
}