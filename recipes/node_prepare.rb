#
# Cookbook Name:: pacemaker
# Recipe:: node_prepare
#
# Copyright 2016, Target Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'pcs'
package 'fence-agents-all'

# Remove node name alias from localhost address
# This confuses corosync setup
## FIXME -- is this EL linux only?
hostsfile_entry '127.0.0.1' do
  hostname 'localhost'
  aliases ['localhost.localdomain']
  comment 'Update by Chef'
  action :update
end

# Set password for hacluster user
user 'hacluster' do
  password node['pacemaker']['pcs']['shadow']
  action :modify
end

# Start service that syncronizes the cluster configs
service 'pcsd' do
  supports restart: true, reload: true, status: true
  action [:enable, :start]
end
