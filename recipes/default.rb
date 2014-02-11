#
# Cookbook Name:: repo_git
#
# Copyright RightScale, Inc. All rights reserved.
# All access and use subject to the RightScale Terms of Service available at
# http://www.rightscale.com/terms.php and, if applicable, other agreements
# such as a RightScale Master Subscription Agreement.

rightscale_marker :begin

remote_file "/usr/bin/jgit" do 
  source "https://repo.eclipse.org/content/groups/releases//org/eclipse/jgit/org.eclipse.jgit.pgm/3.2.0.201312181205-r/org.eclipse.jgit.pgm-3.2.0.201312181205-r.sh"
  owner "root"
  group "root"
  mode "0777"
  action :create
end

template "/root/.jgit" do
  source "jgit.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(:accesskey => node[:repo_jgit][:accesskey],
            :secretkey => node[:repo_jgit][:secretkey],
            :acl => "private"
            )
  action :create
end

rightscale_marker :end
