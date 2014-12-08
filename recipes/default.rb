include_recipe "chef-sugar::default"
include_recipe "gdebi::default"

file = node['wkhtmltox']['url'] % {codename: node['lsb']['codename'], 
                                   arch: _32_bit? ? 'i386' : 'amd64' }

remote_file '/root/wkhtmltox.deb' do
  source file
  retries 3
  action :create_if_missing
end

gdebi_package "/root/wkhtmltox.deb" do
   action :install
end
