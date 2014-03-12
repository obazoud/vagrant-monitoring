include_recipe "apt"
include_recipe "graphite"

include_recipe "monitoring::collectd_base"

graphitus 'graphitus' do
  provider :apache
  ssl_enabled false
  graphite_url 'http://127.0.0.1:8080'
  timezones [ 'UTC' ]
end

data = [
  {
    :title  => 'Load',
    :target => [
      '*.*.load.load.*'
    ]
  },
  {
    :title  => 'Swap',
    :target => [
      '*.*.swap.swap_io.*'
    ]
  },
  {
    :title  => 'Disk operations',
    :target => [
      '*.*.disk.*.disk_ops.*'
    ]
  },
  {
    :title  => 'Interface octets',
    :target => [
      '*.*.interface.*.if_octets.*'
    ]
  }
]

graphitus_dashboard 'example1' do
  title 'Load servers'
  tz 'UTC'
  data data
end