#==============================
# PCS command configuration
#==============================
default['pacemaker']['pcs']['vault'] = 'vault_pacemaker'
default['pacemaker']['pcs']['vault_item'] = 'secrets'
default['pacemaker']['pcs']['password'] = nil
default['pacemaker']['pcs']['shadow'] = nil

#==============================
# Corosync Settings
#==============================

# Mandatory settings
default['pacemaker']['corosync']['cluster_name'] = 'cluster'
# Example: default['corosync']['nodes'] = {'node1' => "#{node['ipaddress']}"}
default['pacemaker']['corosync']['nodes'] = {}
