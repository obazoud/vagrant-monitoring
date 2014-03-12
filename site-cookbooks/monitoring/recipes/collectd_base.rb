include_recipe "collectd"

collectd_plugin "cpu"
collectd_plugin "df"
collectd_plugin "disk"
collectd_plugin "interface"
collectd_plugin "load"
collectd_plugin "logfile" do
  options :LogLevel => "info", :Timestamp => true, :PrintSeverity => true, :File => "/var/log/collectd.log"
end
collectd_plugin "memory"
collectd_plugin "network"
collectd_plugin "processes"
collectd_plugin "swap"
collectd_plugin "uptime"
collectd_plugin "users"

attrs = {
  :write_graphite => {
    :Host => "localhost",
    :Port => "2003",
    :Prefix => "collectd.",
    :SeparateInstances => true,
    :StoreRates => false,
    :AlwaysAppendDS => false,
    :EscapeCharacter => "_",
  }
}
node.override[:collectd].merge!(attrs)

collectd_plugin "write_graphite" do
  cookbook "monitoring"
  template "write_graphite.conf.erb"
  options node[:collectd][:write_graphite]
end
