include_recipe "chef-sugar::default"
include_recipe "gdebi::default"

file = node['wkhtmltox']['url'] % {
                                   version: node['wkhtmltox']['version'],
                                   codename: node['lsb']['codename'], 
                                   arch: _32_bit? ? 'i386' : 'amd64' 
                                  }

file '/root/wkhtmltox.deb' do
  action :delete
  not_if 'test -s /root/wkhtmltox.deb'
end

remote_file '/root/wkhtmltox.deb' do
  source file
  retries 3
  action :create_if_missing
end

gdebi_package "/root/wkhtmltox.deb" do
   action :install
end
