"   Copyright (C) 2018, Ben Reedy <breed808@breed808.com>

"   This program is free software: you can redistribute it and/or modify
"   it under the terms of the GNU General Public License as published by
"   the Free Software Foundation, either version 3 of the License, or
"   (at your option) any later version.

"   This program is distributed in the hope that it will be useful,
"   but WITHOUT ANY WARRANTY; without even the implied warranty of
"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"   GNU General Public License for more details.

"   You should have received a copy of the GNU General Public License
"   along with this program.  If not, see <https://www.gnu.org/licenses/>.


" Vim syntax file
" Language: aos
" Maintainer: Ben Reedy <breed808@breed808.com>

if exists("b:current_syntax")
  finish
endif

" Command keywords
syn match      aosString     /\"[^"]*\"/
syn keyword    aosBool       on off enable disable
syn match      aosDigit      /\s\+\d\+\(\s\+\|\n\)/

syn match      aosKeyword    /^port/


" Health Section
syn match      aosKeyword   /^health/
syn region     aosHealth start="^health" end="\n" transparent oneline display
syn match      aosFunction contained containedin=aosHealth /threshold\s\?\(port-trap\)\?/
syn match      aosFunction contained containedin=aosHealth /statistics reset/
syn keyword    aosFunction contained containedin=aosHealth interval
syn keyword    aosOperator contained containedin=aosHealth rx txrx memory cpu temperature

" System Section
syn match      aosKeyword   /^system/
syn region     aosSystem start="^system" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosSystem contact name location date
syn match      aosFunction contained containedin=aosSystem /daylight savings time/
syn match      aosFunction contained containedin=aosSystem /time-and-date synchro/
syn match      aosFunction contained containedin=aosSystem /\(time\)zone/
syn keyword    aosOperator contained containedin=aosSystem start end in at end by

" Session Section
syn match      aosKeyword   /^session/
syn region     aosSession start="^session" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosSession timeout prompt
syn keyword    aosOperator contained containedin=aosSession cli http default

" Swlog Section
syn match      aosKeyword   /^swlog/
syn region     aosSwlog start="^swlog" end="\n" transparent oneline display
syn match      aosFunction contained containedin=aosSwlog /remote command-log/
syn match      aosFunction contained containedin=aosSwlog /output\s\?\(flash file-size\)\?/
syn keyword    aosFunction contained containedin=aosSwlog syslog-facility-id clear
syn keyword    aosOperator contained containedin=aosSwlog appid level

" AAA section
syn match      aosKeyword   /^aaa/
" radius-server
syn region     aosAAARadius start="^aaa radius-server" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosAAARadius radius-server
syn keyword    aosOperator contained containedin=aosAAARadius host key retransmit timeout auth-port acct-port
syn keyword    aosOperator contained containedin=aosAAARadius mac-address-format-status mac-address-format nas-port
syn keyword    aosOperator contained containedin=aosAAARadius nas-port-id nas-port-type unique-acct-session-id

" Authentication command
syn region     aosAAAAuthentication start="^aaa authentication" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosAAAAuthentication authentication
syn keyword    aosOperator contained containedin=aosAAAAuthentication console telnet ftp http snmp ssh default local

" IP section

" IP Service
syn match      aosKeyword   /^ip/
syn region     aosIPService start="^ip service" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosIPService service
syn keyword    aosOperator contained containedin=aosIP
" Sub-IP section for service keywords
syn keyword    aosIdentifier contained containedin=aosIPService ftp ssh telnet udp-relay http network-time snmp secure-http
syn keyword    aosOperator contained containedin=aosIPService all port

" IP Interface
syn region     aosIPInterface start="^ip interface" end='\n' transparent oneline display
syn keyword    aosFunction contained containedin=aosIPInterface service interface
syn keyword    aosOperator contained containedin=aosIPInterface address mask ifindex vlan

" IP static-route
syn region     aosIPStaticRoute start="^ip static-route" end='\n' transparent oneline display
syn match      aosFunction contained containedin=aosIPStaticRoute /static-route/
syn keyword    aosOperator contained containedin=aosIPStaticRoute mask gateway metric

" IP name-server
syn region     aosIPNameServer start="^ip name-server" end='\n' transparent oneline display
syn match      aosFunction contained containedin=aosIPNameServer /name-server/
syn keyword    aosOperator contained containedin=aosIPNameServer testing

" IP domain-lookup
syn region     aosIPDomainLookup start="^ip domain-lookup" end='\n' transparent oneline display
syn match      aosOperator contained containedin=aosIPDomainLookup /domain-lookup/

" IP DHCP
syn region     aosIPDHCP start="^ip helper" end='\n' transparent oneline display
syn keyword    aosFunction contained containedin=aosIPDHCP helper udp
syn match      aosOperator contained containedin=aosIPDHCP /\(per-\|a\)\?vlan/
syn match      aosOperator contained containedin=aosIPDHCP /forward delay/
syn match      aosOperator contained containedin=aosIPDHCP /maximum hops/
syn keyword    aosOperator contained containedin=aosIPDHCP address standard
syn keyword    aosConstant contained containedin=aosIPDHCP BOOTP NBDD NBNSNBDD DNS TACACS TFTP NTP

" SNMP Section
syn match aosKeyword /^snmp/

" SNMP security
syn region     aosSNMPSecurity start="^snmp security" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosSNMPSecurity security
syn keyword    aosOperator contained containedin=aosSNMPSecurity authentication privacy trap
syn keyword    aosIdentifier contained containedin=aosSNMPSecurity set all only

" SNMP community map
syn region     aosSNMPCommunityMap start="^snmp community map" end="\n" transparent oneline display
syn match      aosFunction contained containedin=aosSNMPCommunityMap /community map/
syn keyword    aosOperator contained containedin=aosSNMPCommunityMap user

" LACP section
syn match      aosKeyword   /^lacp/

syn region     aosLACP start="lacp" end='\n' transparent oneline display
syn keyword    aosFunction contained containedin=aosLACP linkagg agg
syn match      aosOperator contained containedin=aosLACP /admin state/
syn match      aosOperator contained containedin=aosLACP /actor admin key/
syn keyword    aosOperator contained containedin=aosLACP size name

" QOS Section
syn match      aosKeyword   /^qos/
syn region     aosQOS start="^qos" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosQOS port apply
syn match      aosOperator contained containedin=aosQOS /servicing mode/
syn match      aosOperator contained containedin=aosQOS /maximum \(ingress\|egress\)\?-\?bandwidth/
syn match      aosOperator contained containedin=aosQOS /default \(802.1p\|dscp\|classification\)/
syn keyword    aosOperator contained containedin=aosQOS trusted

" VLAN Section
syn match      aosKeyword   /^vlan/
syn region     aosVLAN start="^vlan" end="\n" transparent oneline display
syn match      aosFunction contained containedin=aosVLAN /port default/
syn match      aosFunction contained containedin=aosVLAN /802\.1q/
syn keyword    aosFunction contained containedin=aosVLAN stp mobile-tag source-learning ipmvlan
syn keyword    aosOperator contained containedin=aosVLAN destination source blocked unblocked bidirectional inport outport name

" Port Mirroring
syn match      aosKeyword   /^port/
syn region     aosPort start="^port" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosPort mirroring
syn keyword    aosOperator contained containedin=aosPort destination source blocked unblocked bidirectional inport outport

" Bridging
syn match      aosKeyword   /^bridge/
" Bridge Mode
syn region     aosBridgeMode start="^bridge mode" end="\n" transparent oneline display
syn keyword    aosFunction contained containedin=aosBridgeMode mode
syn keyword    aosOperator contained containedin=aosBridgeMode flat 1x1
" Bridge 1x1
syn region     aosBridge1x1 start="^bridge 1x1" end='\n' transparent oneline display
syn keyword    aosFunction contained containedin=aosBridge1x1 1x1
syn keyword    aosOperator contained containedin=aosBridge1x1 priority

" NTP
syn match      aosKeyword   /^ntp/
syn region     aosNTP start="^ntp" end='\n' transparent oneline display
syn keyword    aosFunction contained containedin=aosNTP server client
syn match      aosFunction contained containedin=aosNTP /broadcast\(-delay\)?/
syn match      aosFunction contained containedin=aosNTP /key\( load\)?/
syn keyword    aosOperator contained containedin=aosNTP key version minpoll prefer load
syn match      aosOperator contained containedin=aosNTP /\(un\)synchronized/
syn match      aosOperator contained containedin=aosNTP /\(un\)trusted/

" POE
syn match      aosKeyword   /^lanpower/
syn region     aosPOE start="^lanpower" end='\n' transparent oneline display
syn keyword    aosOperator contained containedin=aosPOE start stop
syn match      aosOperator contained containedin=aosPOE /combo-port/
syn match      aosOperator contained containedin=aosPOE /priority\(-disconnect\)/
syn match      aosOperator contained containedin=aosPOE /\(max\)power/

" LLDP
syn match      aosKeyword /^lldp/
" LLDP
syn region     aosLLDPNetworkPolicy start="^lldp" end="\n" transparent oneline display
syn match      aosFunction contained containedin=aosLLDPNetworkPolicy /\(med\)\?\s\?network-policy/
syn match      aosFunction contained containedin=aosLLDPNetworkPolicy /l2-priority/
syn keyword    aosOperator contained containedin=aosLLDPNetworkPolicy application vlan lldpdu dscp
syn match      aosIdentifier contained containedin=aosLLDPNetworkPolicy /\(guest-\|softphone\|streaming\)\?\(video\|voice\)\(-signaling\)\?/
syn keyword    aosIdentifier contained containedin=aosLLDPNetworkPolicy chassis

syn match   aosComment    /!.*$/
syn match   aosComment    /no\s+.*$/
syn match   aosDisabled   /no\s\+.*/
syn match   aosComment    /^no\s.*$/

syn match   aosInterface  /\d\+\/\d\+/


" IPv4
syn match   aosIpv4       /\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\(\/[0-9]\{1,2\}\)\?/

" IPv6
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{7}\(\:\|\(\x\{1,4}\)\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{6}\(\:\|\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\|\(\:\x\{1,4}\)\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{5}\(\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)\|\(\(\:\x\{1,4}\)\{1,2}\)\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{4}\(\:\x\{1,4}\)\{0,1}\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{4}\(\:\x\{1,4}\)\{0,1}\(\(\:\x\{1,4}\)\{1,2}\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{3}\(\:\x\{1,4}\)\{0,2}\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{3}\(\:\x\{1,4}\)\{0,2}\(\(\:\x\{1,4}\)\{1,2}\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{2}\(\:\x\{1,4}\)\{0,3}\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\{2}\(\:\x\{1,4}\)\{0,3}\(\(\:\x\{1,4}\)\{1,2}\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\(\:\x\{1,4}\)\{0,4}\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)/
syn match   aosIpv6       /\s\(\x\{1,4}\:\)\(\:\x\{1,4}\)\{0,4}\(\(\:\x\{1,4}\)\{1,2}\)/
syn match   aosIpv6       /\s\:\(\:\x\{1,4}\)\{0,5}\(\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)\|\(\(\:\x\{1,4}\)\{1,2}\)\)/

hi link aosBool           Boolean
hi link aosKeyword        Statement
hi link aosProtocol       Type
hi link aosComment        Comment
hi link aosString         String
hi link aosDef            String
hi link aosInterface      Identifier
hi link aosIdentifier     Identifier
hi link aosIpv4           Number
hi link aosIpv6           Number
hi link aosDigit          Number
hi link aosDisabled       Error
hi link aosOperator       Operator
hi link aosFunction       Function

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = "aos"
