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
  final bool showBookmark;
  final VoidCallback onTap;
  final VoidCallback onIcon;
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
    this.showBookmark = true,
    required this.onTap,
    required this.onIcon,
    this.icon = Icons.bookmark,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: design.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: design.borderColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCompanyInfo(),
                if (showBookmark)
                  GestureDetector(
                    onTap: onIcon,
                    child: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked
                          ? design.primaryColor
                          : design.darkGrayColor,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              role,
              style: TextStyle(
                fontFamily: design.fontFamily,
                fontSize: design.textFontSize,
                color: design.textColor,
                fontWeight: design.semiBold,
              ),
            ),
            const SizedBox(height: 6),

            _buildLocationAndJobType(),
            const SizedBox(height: 6),

            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: design.subTextFontSize,
                fontWeight: design.light,
                color: design.subTextColor,
                fontFamily: design.fontFamily,

              ),
            ),
            const SizedBox(height: 12),

            _buildStatsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    final design = DesignConfig.current;

    return Row(
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
            color: design.subTextColor,
            fontFamily: design.fontFamily,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAndJobType() {
    final design = DesignConfig.current;

    return RichText(
      text: TextSpan(
        text: location,
        style: TextStyle(
          fontFamily: design.fontFamily,
          fontSize: design.tinyFontSize,
          color: design.subTextColor,
          fontWeight: design.light,
        ),
        children: [
          const TextSpan(text: ' • '),
          TextSpan(
            text: jobType,
            style: TextStyle(
              fontSize: design.tinyFontSize,
              fontWeight: design.light,
              color: design.primaryColor,
              fontFamily: design.fontFamily,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    final design = DesignConfig.current;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildIconText( Icons.group, '$applicants'),
            const SizedBox(width: 12),
            _buildIconText(Icons.remove_red_eye, '$views'),
          ],
        ),
        Text(
          date,
          style: TextStyle(
            fontSize: design.tinyFontSize,
            fontWeight: design.light,
            color: design.subTextColor,
            fontFamily: design.fontFamily,
          ),
        ),
      ],
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    final design = DesignConfig.current;

    return Row(
      children: [
        Icon(icon,
            size: design.textFontSize,
          color: design.subTextColor,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: design.tinyFontSize,
            fontWeight: design.light,
            color: design.subTextColor,
            fontFamily: design.fontFamily,
          ),
        ),
      ],
    );
  }
}
