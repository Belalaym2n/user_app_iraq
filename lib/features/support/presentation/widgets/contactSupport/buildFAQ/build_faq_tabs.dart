import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
 import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../data/models/build_faq_questions.dart';
import 'build_faq.dart';
import 'build_faq_header.dart';

class BuildFaqTabs extends StatefulWidget {
  BuildFaqTabs({super.key,required this.searchQuery,
    required this.searchController});
  String searchQuery ;

  TextEditingController searchController;

  @override
  State<BuildFaqTabs> createState() => _BuildFaqTabsState();
}

late TabController _tabController;

class _BuildFaqTabsState extends State<BuildFaqTabs>
    with SingleTickerProviderStateMixin {

  int? _expandedIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<FaqItem> _getFilteredFaqs(String category) {
    final faqsData = faqs[category] ?? [];
    if (widget.searchQuery.isEmpty) return faqsData;

    return faqsData.where((faq) {
      return faq.question.toLowerCase().contains(widget.searchQuery.toLowerCase()) ||
          faq.answer.toLowerCase().contains(widget.searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabContent()),
      ],
    );
  }

  Widget _buildTabContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildFaqList(LocaleKeys.Support_General.tr()),
        _buildFaqList(LocaleKeys.Support_Requests.tr()),
        _buildFaqList(LocaleKeys.Support_payment.tr()),
        _buildFaqList(LocaleKeys.Support_Tracking.tr()),
      ],
    );
  }

  Widget _buildFaqList(String category) {
    final faqs = _getFilteredFaqs(category);

    if (faqs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: AppColors.textMuted),
            const SizedBox(height: 16),
            Text(
              'No results found',
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return _buildFaqCard(faqs[index], index);
      },
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.neutralGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.textSecondary,
        indicator: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryColor, AppColors.primaryLight],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        onTap: (_) {
          setState(() {
            _expandedIndex = null;
          });
        },
        tabs:   [
          Tab(text: LocaleKeys.Support_General.tr()),

          Tab(text:  LocaleKeys.Support_Requests.tr()),
          Tab(text: LocaleKeys.Support_Payments.tr()),
          Tab(text: LocaleKeys.Support_Tracking.tr()),
        ],
      ),
    );
  }

  Widget _buildFaqCard(FaqItem faq, int index) {
    final isExpanded = _expandedIndex == index;
    final categoryColor = _getCategoryColor();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isExpanded
              ? categoryColor.withOpacity(0.3)
              : AppColors.borderColor,
          width: isExpanded ? 2 : 1,
        ),
        boxShadow: isExpanded
            ? [
                BoxShadow(
                  color: categoryColor.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _expandedIndex = isExpanded ? null : index;
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: categoryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(faq.icon, color: categoryColor, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      faq.question,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: isExpanded ? 0.5 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: categoryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  Divider(color: AppColors.borderColor),
                  const SizedBox(height: 12),
                  Text(
                    faq.answer,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor() {
    switch (_tabController.index) {
      case 0:
        return AppColors.primaryColor;
      case 1:
        return AppColors.successColor;
      case 2:
        return AppColors.secondaryColor;
      case 3:
        return AppColors.infoColor;
      default:
        return AppColors.primaryColor;
    }
  }
}
