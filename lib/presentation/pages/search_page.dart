import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/widgets/button_text.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/icon_textfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _ctrl = TextEditingController();
  String _query = '';
  bool _isAdvanced = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignConfig.backgroundColor,
      appBar: AppBarBuilder(title: 'Search', automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            IconTextField(
              controller: _ctrl,
              icon: Icons.search,
              hintText: "Enter Keyword",
              onChanged: (v) => setState(() => _query = v.trim()),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Advanced Search',
                  style: TextStyle(
                    fontFamily: DesignConfig.fontFamily,
                    fontSize: DesignConfig.textSize,
                    fontWeight: DesignConfig.semiBold,
                    color: DesignConfig.textColor
                  ),
                ),
                Switch(
                  value: _isAdvanced,
                  onChanged: (val) {
                    setState(() {
                      _isAdvanced = val;
                    });
                  },
                  activeColor: DesignConfig.primaryColor,
                ),
              ],
            ),

            /// Optional: Show advanced search fields conditionally
            if (_isAdvanced)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text("Advanced filters go here..."),
              ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ButtonText(title: 'Search',onTap: (){},
              backgroundColor: DesignConfig.primaryColor)
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
