import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';

class ReportScreen extends StatelessWidget {
  final String childName;
  final String childId;
  final Function(String) onNavigate;
  final String currentScreen;

  const ReportScreen({
    super.key,
    required this.childName,
    required this.childId,
    required this.onNavigate,
    required this.currentScreen,
  });

  @override
  Widget build(BuildContext context) {
    final subjects = [
      {'subject': 'Computer Science 101', 'attended': 28, 'total': 30, 'percentage': 93},
      {'subject': 'Mathematics', 'attended': 25, 'total': 28, 'percentage': 89},
      {'subject': 'Physics', 'attended': 22, 'total': 25, 'percentage': 88},
      {'subject': 'English', 'attended': 30, 'total': 32, 'percentage': 94},
      {'subject': 'Data Structures', 'attended': 26, 'total': 30, 'percentage': 87},
    ];

    final monthlyData = [
      {'month': 'September', 'present': 22, 'absent': 2, 'late': 1},
      {'month': 'October', 'present': 24, 'absent': 1, 'late': 0},
      {'month': 'November', 'present': 20, 'absent': 3, 'late': 2},
      {'month': 'December', 'present': 18, 'absent': 1, 'late': 1},
      {'month': 'January', 'present': 15, 'absent': 0, 'late': 0},
    ];

    const totalClasses = 145;
    const attended = 131;
    const absent = 7;
    const late = 4;
    const percentage = 92;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 28,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF22C55E)],
                      ),
                    ),
                    child: SafeArea(
                      bottom: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () => onNavigate('dashboard'),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Back',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Attendance Report',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$childName • ID: $childId',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xFFBFDBFE),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Transform.translate(
                        offset: const Offset(0, -20),
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Overall Summary',
                                      style: GoogleFonts.inter(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF111827),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.trending_up,
                                      color: Color(0xFF22C55E),
                                      size: 22,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '$percentage%',
                                  style: GoogleFonts.inter(
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                                Text(
                                  'Total Attendance Rate',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: const Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 2.2,
                                  children: [
                                    _SummaryTile(
                                      value: '$attended',
                                      label: 'Classes Attended',
                                      bgColor: const Color(0xFFDCFCE7),
                                      textColor: const Color(0xFF16A34A),
                                    ),
                                    _SummaryTile(
                                      value: '$totalClasses',
                                      label: 'Total Classes',
                                      bgColor: const Color(0xFFDBEAFE),
                                      textColor: const Color(0xFF2563EB),
                                    ),
                                    _SummaryTile(
                                      value: '$absent',
                                      label: 'Absent Days',
                                      bgColor: const Color(0xFFFEE2E2),
                                      textColor: const Color(0xFFDC2626),
                                    ),
                                    _SummaryTile(
                                      value: '$late',
                                      label: 'Late Arrivals',
                                      bgColor: const Color(0xFFFEF3C7),
                                      textColor: const Color(0xFFD97706),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 12),
                        child: Text(
                          'SUBJECT-WISE ATTENDANCE',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF6B7280),
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: List.generate(subjects.length, (i) {
                              final s = subjects[i];
                              final pct = s['percentage'] as int;
                              final isLast = i == subjects.length - 1;
                              Color barColor;
                              Color textColor;
                              if (pct >= 90) {
                                barColor = const Color(0xFF22C55E);
                                textColor = const Color(0xFF16A34A);
                              } else if (pct >= 75) {
                                barColor = const Color(0xFFF59E0B);
                                textColor = const Color(0xFFD97706);
                              } else {
                                barColor = const Color(0xFFEF4444);
                                textColor = const Color(0xFFDC2626);
                              }
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                s['subject'] as String,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0xFF111827),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '$pct%',
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: textColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: LinearProgressIndicator(
                                                  value: pct / 100,
                                                  backgroundColor:
                                                      const Color(0xFFE5E7EB),
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(barColor),
                                                  minHeight: 8,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              '${s['attended']}/${s['total']}',
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                color: const Color(0xFF9CA3AF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!isLast)
                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Color(0xFFF3F4F6),
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 12),
                        child: Text(
                          'MONTHLY BREAKDOWN',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF6B7280),
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: List.generate(monthlyData.length, (i) {
                              final m = monthlyData[i];
                              final isLast = i == monthlyData.length - 1;
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_today_outlined,
                                              size: 16,
                                              color: Color(0xFF9CA3AF),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              m['month'] as String,
                                              style: GoogleFonts.inter(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF111827),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            _MonthStat(
                                              value: '${m['present']}',
                                              label: 'Present',
                                              color: const Color(0xFF16A34A),
                                            ),
                                            _MonthStat(
                                              value: '${m['absent']}',
                                              label: 'Absent',
                                              color: const Color(0xFFDC2626),
                                            ),
                                            _MonthStat(
                                              value: '${m['late']}',
                                              label: 'Late',
                                              color: const Color(0xFFD97706),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!isLast)
                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Color(0xFFF3F4F6),
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF3B82F6), Color(0xFF22C55E)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Downloading report...'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.download,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Download Full Report',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          BottomNavBar(
            currentScreen: currentScreen,
            onNavigate: onNavigate,
          ),
        ],
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  final String value;
  final String label;
  final Color bgColor;
  final Color textColor;

  const _SummaryTile({
    required this.value,
    required this.label,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: const Color(0xFF6B7280),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _MonthStat extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _MonthStat({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: const Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}