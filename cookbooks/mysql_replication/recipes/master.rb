cnf_file = node['mysql']['server']['directories']['confd_dir'] + "/repl_master.cnf"
template cnf_file do
  source "master.cnf.erb"
  notifies :restart, 'service[mysql]'
end

