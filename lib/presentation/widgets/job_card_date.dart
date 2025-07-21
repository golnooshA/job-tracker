import 'package:flutter/material.dart';

import '../../core/config/design_config.dart';

class JobCardDate extends StatelessWidget {
  final String companyName;
  final String role;
  final String location;
  final String jobType;
  final String description;
  final int applicants;
  final int views;
  final String date;
  final String companyLogo;
  final bool isBookmarked;
  final bool showBookmark; // NEW PARAMETER
  final VoidCallback onTap;
  final IconData icon;

  const JobCardDate({
    super.key,
    required this.companyName,
    required this.role,
    required this.location,
    required this.jobType,
    required this.description,
    required this.applicants,
    required this.views,
    required this.date,
    required this.companyLogo,
    this.isBookmarked = false,
    this.showBookmark = true, // DEFAULT TRUE
    required this.onTap,
    this.icon = Icons.bookmark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: DesignConfig.backgroundColor,
          borderRadius: DesignConfig.border,
          border: Border.all(color: DesignConfig.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: logo + name + optional bookmark
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(companyLogo),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      companyName,
                      style: const TextStyle(
                        fontFamily: DesignConfig.fontFamily,
                        fontSize: DesignConfig.subTextSize,
                        color: DesignConfig.subTextColor,
                        fontWeight: DesignConfig.semiBold,
                      ),
                    ),
                  ],
                ),
                if (showBookmark)
                  Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked
                        ? DesignConfig.primaryColor
                        : DesignConfig.unSelectedIcon,
                  ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              role,
              style: const TextStyle(
                fontFamily: DesignConfig.fontFamily,
                fontSize: DesignConfig.textSize,
                color: DesignConfig.textColor,
                fontWeight: DesignConfig.semiBold,
              ),
            ),

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: RichText(
                text: TextSpan(
                  text: location,
                  style: const TextStyle(
                    fontFamily: DesignConfig.fontFamily,
                    fontSize: DesignConfig.tinyTextSize,
                    color: DesignConfig.subTextColor,
                    fontWeight: DesignConfig.light,
                  ),
                  children: [
                    const TextSpan(text: ' • '),
                    TextSpan(
                      text: jobType,
                      style: const TextStyle(
                        fontFamily: DesignConfig.fontFamily,
                        fontSize: DesignConfig.tinyTextSize,
                        color: DesignConfig.primaryColor,
                        fontWeight: DesignConfig.light,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              description,
              style: const TextStyle(
                fontFamily: DesignConfig.fontFamily,
                fontSize: DesignConfig.subTextSize,
                color: DesignConfig.subTextColor,
                fontWeight: DesignConfig.light,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.group,
                      size: DesignConfig.iconSmallSize,
                      color: DesignConfig.unSelectedIcon,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "$applicants",
                      style: const TextStyle(
                        fontFamily: DesignConfig.fontFamily,
                        fontSize: DesignConfig.tinyTextSize,
                        color: DesignConfig.subTextColor,
                        fontWeight: DesignConfig.light,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.remove_red_eye,
                      size: DesignConfig.iconSmallSize,
                      color: DesignConfig.unSelectedIcon,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "$views",
                      style: const TextStyle(
                        fontFamily: DesignConfig.fontFamily,
                        fontSize: DesignConfig.tinyTextSize,
                        color: DesignConfig.subTextColor,
                        fontWeight: DesignConfig.light,
                      ),
                    ),
                  ],
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontFamily: DesignConfig.fontFamily,
                    fontSize: DesignConfig.tinyTextSize,
                    color: DesignConfig.subTextColor,
                    fontWeight: DesignConfig.light,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
