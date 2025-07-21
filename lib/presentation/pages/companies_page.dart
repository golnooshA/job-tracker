import 'package:flutter/material.dart';
import 'package:job_tracker/core/config/design_config.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/job_card.dart';

import '../widgets/icon_textfield.dart';
import '../widgets/image_text_button.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCtrl = TextEditingController();


    return Scaffold(
      appBar: AppBarBuilder(title: 'Companies'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child:
        Column(
          children: [
            const SizedBox(height: 20),

            IconTextField(
              controller: searchCtrl,
              icon: Icons.search,
              hintText: "Enter Company",
              onChanged: (p0) {},
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: 12,
              runSpacing: 16,
              children: List.generate(10, (index) {
                return ImageTextButton(
                  image: 'assets/images/banner_1.png',
                  text: 'Spotify',
                  onTap: () {},
                );
              }),
            ),
          ],
        ),

      ),
    );
  }
}
