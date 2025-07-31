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
    final design = DesignConfig.current;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: design.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: design.darkGrayColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Logo + Company Name + Bookmark Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: companyLogo.startsWith('http')
                          ? NetworkImage(companyLogo)
                          : AssetImage(companyLogo) as ImageProvider,
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      companyName,
                      style: TextStyle(
                        fontWeight: design.semiBold,
                        fontSize: design.textFontSize,
                        color: design.textColor,
                        fontFamily: design.fontFamily,
                      ),
                    ),
                  ],
                ),
                Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked
                      ? design.primaryColor
                      : design.darkGrayColor,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Job Role
            Text(
              role,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: design.fontFamily,
                fontSize: design.textFontSize,
                color: design.textColor,
                fontWeight: design.semiBold,
              ),
            ),
            const SizedBox(height: 6),

            // Location
            Text(
              location,
              style: TextStyle(
                fontFamily: design.fontFamily,
                fontSize: design.tinyFontSize,
                color: design.subTextColor,
                fontWeight: design.light,
              ),
            ),
            const SizedBox(height: 6),

            // Job Type
            Text(
              jobType,
              style: TextStyle(
                fontSize: design.tinyFontSize,
                fontWeight: design.light,
                color: design.primaryColor,
                fontFamily: design.fontFamily,
              ),
            ),
            const SizedBox(height: 12),

            // Applicants and Views
            Row(
              children: [
                _buildStatIconText(
                  context,
                  icon: Icons.group,
                  value: applicants.toString(),
                ),
                const SizedBox(width: 16),
                _buildStatIconText(
                  context,
                  icon: Icons.remove_red_eye,
                  value: views.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatIconText(BuildContext context, {required IconData icon, required String value}) {
    final theme = Theme.of(context);
    final design = DesignConfig.current;

    return Row(
      children: [
        Icon(icon, size: design.textFontSize, color: theme.iconTheme.color?.withOpacity(0.6)),
        const SizedBox(width: 4),
        Text(
          value,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.hintColor,
            fontSize: design.tinyFontSize,
            fontWeight: design.light,
            fontFamily: design.fontFamily,
          ),
        ),
      ],
    );
  }
}
