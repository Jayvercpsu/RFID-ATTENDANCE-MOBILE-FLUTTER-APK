import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  final String parentName;
  final String childName;
  final String childId;
  final Function(String) onNavigate;
  final String currentScreen;

  const DashboardScreen({
    super.key,
    required this.parentName,
    required this.childName,
    required this.childId,
    required this.onNavigate,
    required this.currentScreen,
  });

  @override
  Widget build(BuildContext context) {
    const todayStatus = 'present';
    const timeIn = '08:15 AM';
    const date = 'Wednesday, January 28, 2026';
    const totalAttendance = 92;
    const lateRecords = 3;
    const absentDays = 5;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 56,
                      left: 24,
                      right: 24,
                      bottom: 40,
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
                          Text(
                            'Welcome, $parentName',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xFFBFDBFE),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            childName,
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Student ID: $childId',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xFFBFDBFE),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            date,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFFBFDBFE),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Transform.translate(
                        offset: const Offset(0, -24),
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.black12,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today's Attendance",
                                      style: GoogleFonts.inter(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF111827),
                                      ),
                                    ),
                                    Icon(
                                      todayStatus == 'present'
                                          ? Icons.check_circle
                                          : Icons.cancel,
                                      color: todayStatus == 'present'
                                          ? const Color(0xFF22C55E)
                                          : const Color(0xFFEF4444),
                                      size: 26,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Divider(height: 1, color: Color(0xFFF3F4F6)),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF6B7280),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: todayStatus == 'present'
                                            ? const Color(0xFFDCFCE7)
                                            : const Color(0xFFFEE2E2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        todayStatus == 'present'
                                            ? 'Present'
                                            : 'Absent',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: todayStatus == 'present'
                                              ? const Color(0xFF16A34A)
                                              : const Color(0xFFDC2626),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Time In',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF6B7280),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Color(0xFF374151),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          timeIn,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: const Color(0xFF111827),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 12),
                        child: Text(
                          'ATTENDANCE SUMMARY',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF6B7280),
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      _StatCard(
                        icon: Icons.check_circle,
                        iconBgColor: const Color(0xFFDBEAFE),
                        iconColor: const Color(0xFF2563EB),
                        accentColor: const Color(0xFF2563EB),
                        label: 'Total Attendance',
                        value: '$totalAttendance%',
                      ),
                      const SizedBox(height: 12),
                      _StatCard(
                        icon: Icons.access_time_filled,
                        iconBgColor: const Color(0xFFFEF3C7),
                        iconColor: const Color(0xFFD97706),
                        accentColor: const Color(0xFFD97706),
                        label: 'Late Records',
                        value: '$lateRecords',
                      ),
                      const SizedBox(height: 12),
                      _StatCard(
                        icon: Icons.cancel,
                        iconBgColor: const Color(0xFFFEE2E2),
                        iconColor: const Color(0xFFDC2626),
                        accentColor: const Color(0xFFDC2626),
                        label: 'Absent Days',
                        value: '$absentDays',
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: OutlinedButton(
                          onPressed: () => onNavigate('report'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFD1D5DB)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.description_outlined,
                                color: Color(0xFF374151),
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'View Full Report',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF374151),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF9CA3AF),
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
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

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final Color accentColor;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.accentColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 1,
        shadowColor: Colors.black12,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconBgColor,
                ),
                child: Icon(icon, color: iconColor, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: GoogleFonts.inter(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111827),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}