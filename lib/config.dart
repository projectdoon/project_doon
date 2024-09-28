

import 'dart:io';

// String urlInit='';
//
// Future<void> getIpAddress() async {
//   try {
//     for (var interface in await NetworkInterface.list()) {
//       for (var addr in interface.addresses) {
//         if (addr.type == InternetAddressType.IPv4) {
//           print('IP Address: ${addr.address}');
//           urlInit=addr.address;
//           print('urlInit ${urlInit}');
//         }
//       }
//     }
//
//   } catch (e) {
//     print('Failed to get IP address: $e');
//   }
// }
//
// void main() {
//   getIpAddress();
//
// }





final url ="http://192.168.63.252:3000/";
final registration = url+"registration";
final login =url+'login';
final complainRegistration=url+'complainreg';
final getAlertData =url+'alert';
final getComplainData=url+'getComplainList';

