import 'package:flutter/material.dart';
import 'package:job_tracker/core/config/design_config.dart';

class JobCard extends StatelessWidget {
  final String companyLogo;
  final String companyName;
  final String role;
  final String location;
  final String jobType;
  final int applicants;
  final int views;
  final VoidCallback onTap;
  final bool isBookmarked;

  const JobCard({
    super.key,
    required this.companyLogo,
    required this.companyName,
    required this.role,
    required this.location,
    required this.jobType,
    required this.applicants,
    required this.views,
    required this.onTap,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: DesignConfig.backgroundColor,
          borderRadius: DesignConfig.border,
          border: Border.all(color: DesignConfig.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            Text(
              location,
              style: const TextStyle(
                fontFamily: DesignConfig.fontFamily,
                fontSize: DesignConfig.tinyTextSize,
                color: DesignConfig.subTextColor,
                fontWeight: DesignConfig.light,
              ),
            ),
            const SizedBox(height: 6),

            Text(
              jobType,
              style: TextStyle(
                fontFamily: DesignConfig.fontFamily,
                fontSize: DesignConfig.tinyTextSize,
                color: DesignConfig.primaryColor,
                fontWeight: DesignConfig.light,
              ),
            ),
            const SizedBox(height: 12),

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
                const SizedBox(width: 16),
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
          ],
        ),
      ),
    );
  }
}
