You have 3 stacks with the following resources
IAM
# resources
- resource group
- sp app
- sp
- sp role
# outputs
- resource_group_name
- resource_group_location
- service_principal_application_id
- service_principal_id
- role_assignment_id
- role_assignment_scope
- role_assignment_principal_id
- role_assignment_role_definition_name
NETWORK
# resources
- vnet
- subnet for aks
- subnet for virtual node
- azure load balancer
- public ip 
- azure load balancer backend address pool
- azure load balancer probe
# outputs 
- resource_group_id
- vnet_id
- aks_subnet_id
- virtual_node_subnet_id
AKS
# resources
- aks cluster with defaulot node pool
- karpenter node pool
# outputs 
- aks_name
- aks_kubeconfig
- aks_fqdn
- argocd_url