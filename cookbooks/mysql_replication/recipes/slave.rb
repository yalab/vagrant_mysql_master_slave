include_recipe 'mysql::ruby'
require 'mysql'
cnf_file = node['mysql']['server']['directories']['confd_dir'] + "/repl_slave.cnf"
template cnf_file do
  source "slave.cnf.erb"
  notifies :restart, 'service[mysql]'
end

ruby_block "start_replication" do
  block do
    m = Mysql.new("localhost", "root", node[:mysql][:server_root_password])
    master = node['mysql']['master']
    command = %Q{
      CHANGE MASTER TO
        MASTER_HOST="#{master['address']}",
        MASTER_USER="repl",
        MASTER_PASSWORD="#{master['password']}";
      }
    Chef::Log.info "Sending start replication command to mysql: "
    m.query("stop slave")
    m.query(command)
    m.query("start slave")
  end
  not_if do
    m = Mysql.new("localhost", "root", node[:mysql][:server_root_password])
    slave_sql_running = ""
    m.query("show slave status") {|r| r.each_hash {|h| slave_sql_running = h['Slave_SQL_Running'] } }
    slave_sql_running == "Yes"
  end
end
