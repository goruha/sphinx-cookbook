#
# Cookbook Name:: sphinx
# Recipe:: package
#
# Copyright 2012, Riot Games, Inc.
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

case node[:platform_family]
when 'debian'
  sphinx_package_name = 'sphinxsearch'
when 'rhel'
  sphinx_package_name = 'sphinx'
  include_recipe node[:sphinx][:yum_repo] unless node[:sphinx][:yum_repo].empty?
else
  sphinx_package_name= 'sphinx'
end

sphinx_package_name = node[:sphinx][:package_name] || sphinx_package_name

package "sphinx" do
  version node[:sphinx][:version] unless node[:sphinx][:version].nil?
  action :install
  package_name sphinx_package_name
end
