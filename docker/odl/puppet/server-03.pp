class { 'opendaylight':
   enable_ha     => true,
   ha_node_ips   => ['10.100.100.101', '10.100.100.102', '10.100.100.103'],
   ha_node_index => 3,
   default_features =>  ['config', 'standard', 'region', 'package', 'kar', 'ssh', 'management'],
   extra_features   =>  ['odl-dlux-core',
                         'odl-restconf',
                         'odl-l2switch-switch',
                         'odl-mdsal-apidocs',
                         'odl-dluxapps-applications',
                         'odl-dluxapps-nodes',
                         'odl-dluxapps-topology',
                         'odl-dluxapps-yangutils',
                         'odl-dluxapps-yangman'],
}

