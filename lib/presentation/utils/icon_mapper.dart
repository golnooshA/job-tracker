import 'package:flutter/material.dart';

final Map<String, IconData> iconMap = {
  'design_services': Icons.design_services,
  'code': Icons.code,
  'network_wifi': Icons.network_wifi,
  'verified': Icons.verified,
  'campaign': Icons.campaign,
  'person': Icons.person,
  'analytics': Icons.analytics,
  'more_horiz': Icons.more_horiz,
};

IconData getIconByName(String name) => iconMap[name] ?? Icons.help_outline;