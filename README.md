# rbshodan
A shodan client built in ruby

[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)

# Installation
```
$ gem install rbshodan
```

# Usage
```
require "rbshodan"

client = rbshodan.client.new(key: "YOUR_API_KEY")
```

- shodan search methods

- host search
```
client.host_search("mongodb")
client.host_search("nginx")
client.host_search("apache", after: "1/12/16")
client.host_search("ssh", port: 22, page: 1)
client.host_search("ssh", port: 22, page: 2)
client.host_search("ftp", port: 21, facets: { link: "Ethernet or modem" })
````

#### Host Information

Returns all services that have been found on the given host IP.

```ruby
client.host("8.8.8.8")                
client.host("8.8.8.8", history: true) 
client.host("8.8.8.8", minify: true)  
```

#### Host Search

Search Shodan using the same query syntax as the website and use facets to get summary information for different properties.

```ruby
client.host_search("mongodb")
client.host_search("nginx")
client.host_search("apache", after: "1/12/16")
client.host_search("ssh", port: 22, page: 1)
client.host_search("ssh", port: 22, page: 2)
client.host_search("ftp", port: 21, facets: { link: "Ethernet or modem" })
```

#### Scan Targets

Use this method to request Shodan to crawl an IP or netblock.

```ruby
client.scan("8.8.8.8")
```

#### Crawl Internet for Port

Use this method to request Shodan to crawl the Internet for a specific port.

This method is restricted to security researchers and companies with a Shodan Data license. To apply for access to this method as a researcher, please email `jmath@shodan.io` with information about your project. Access is restricted to prevent abuse.

```ruby
client.crawl_for(port: 80, protocol: "http")
```

#### List Community Queries

Use this method to obtain a list of search queries that users have saved in Shodan.

```ruby
client.community_queries
client.community_queries(page: 2)
client.community_queries(sort: "votes")
client.community_queries(sort: "votes", page: 2)
client.community_queries(order: "asc")
client.community_queries(order: "desc")
```

#### DNS Lookup

Look up the IP address for the provided list of hostnames.

```ruby
client.resolve("google.com")
client.resolve("google.com", "bing.com")
```

#### Reverse DNS Lookup

Look up the hostnames that have been defined for the given list of IP addresses.

```ruby
client.reverse_lookup("74.125.227.230")
client.reverse_lookup("74.125.227.230", "204.79.197.200")
```

#### HTTP Headers

Shows the HTTP headers that your client sends when connecting to a webserver.

```ruby
client.http_headers
```

#### Your IP Address

Get your current IP address as seen from the Internet.

```ruby
client.my_ip
```

#### Honeypot Score

Calculates a honeypot probability score ranging from 0 (not a honeypot) to 1.0 (is a honeypot).

```ruby
client.honeypot_score('8.8.8.8')
```

#### Banners Filtered by ASN

This stream provides a filtered, bandwidth-saving view of the Banners stream in case you are only interested in devices located in certain ASNs.

```ruby
client.banners_within_asns(3303, 32475) do |data|
  # do something with banner data
  puts data
end
```

#### Banners Filtered by Country

This stream provides a filtered, bandwidth-saving view of the Banners stream in case you are only interested in devices located in certain countries.

```ruby
client.banners_within_countries("DE", "US", "JP") do |data|
  # do something with banner data
  puts data
end
```

#### Banners Filtered by Ports

Only returns banner data for the list of specified ports. This stream provides a filtered, bandwidth-saving view of the Banners stream in case you are only interested in a specific list of ports.

```ruby
client.banners_on_ports(21, 22, 80) do |data|
  # do something with banner data
  puts data
end
```

#### Banners by Network Alerts

Subscribe to banners discovered on all IP ranges described in the network alerts.

```ruby
client.alerts do |data|
  # do something with banner data
  puts data
end
```

#### Banner Filtered by Alert ID

Subscribe to banners discovered on the IP range defined in a specific network alert.

```ruby
client.alert("HKVGAIRWD79Z7W2T") do |data|
  # do something with banner data
  puts data
end
```

### Exploits API

The Exploits API provides access to several exploit/ vulnerability data sources. Refer to the [Exploits API](https://developer.shodan.io/api/exploits/rest) documentation for more ideas on how to use it.

#### Search

Search across a variety of data sources for exploits and use facets to get summary information.

```ruby
client.exploits_api.search("python")             # Search for python vulns.
client.exploits_api.search(port: 22)             # Port number for the affected service if the exploit is remote.
client.exploits_api.search(type: "shellcode")    # A category of exploit to search for.
client.exploits_api.search(osvdb: "100007")      # Open Source Vulnerability Database ID for the exploit.
```

#### Count

This method behaves identical to the Exploits API `search` method with the difference that it doesn't return any results.

```ruby
client.exploits_api.count("python")             # Count python vulns.
client.exploits_api.count(port: 22)             # Port number for the affected service if the exploit is remote.
client.exploits_api.count(type: "shellcode")    # A category of exploit to search for.
client.exploits_api.count(osvdb: "100007")      # Open Source Vulnerability Database ID for the exploit.
```
