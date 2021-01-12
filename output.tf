output "server" {
  value = hcloud_server.server
}

output "server_ips" {
  value = {
    for server in hcloud_server.server :
    server.name => server.ipv4_address
  }
}

# output "floating_ip" {
#   value = hcloud_floating_ip.default
# }

output "lb_servers_ip" {
  value = hcloud_load_balancer.default.ipv4
}
