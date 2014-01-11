cnf_file = node['mysql']['server']['directories']['confd_dir'] + "/barracuda.cnf"
template cnf_file do
  source "barracuda.cnf.erb"
  notifies :restart, 'service[mysql]'
end
