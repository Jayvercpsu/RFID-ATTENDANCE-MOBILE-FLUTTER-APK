import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';

class NotificationsScreen extends StatelessWidget {
  final String childName;
  final Function(String) onNavigate;
  final String currentScreen;

  const NotificationsScreen({
    super.key,
    required this.childName,
    required this.onNavigate,
    required this.currentScreen,
  });

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'id': '1',
        'type': 'alert',
        'title': 'Attendance Alert',
        'message':
            "$childName's attendance has dropped below 85%. Please ensure regular attendance.",
        'date': 'Today',
        'time': '10:30 AM',
        'isRead': false,
      },
      {
        'id': '2',
        'type': 'success',
        'title': 'Check-in Confirmed',
        'message':
            '$childName successfully checked in for Computer Science 101 at 8:15 AM.',
        'date': 'Today',
        'time': '8:15 AM',
        'isRead': false,
      },
      {
        'id': '3',
        'type': 'announcement',
        'title': 'System Announcement',
        'message':
            'New RFID cards will be distributed next week. Please collect from admin office.',
        'date': 'Yesterday',
        'time': '2:45 PM',
        'isRead': true,
      },
      {
        'id': '4',
        'type': 'info',
        'title': 'Attendance Reminder',
        'message':
            'Reminder: Please ensure $childName scans their card when entering class.',
        'date': 'Jan 26',
        'time': '9:00 AM',
        'isRead': true,
      },
      {
        'id': '5',
        'type': 'alert',
        'title': 'Late Arrival Notice',
        'message':
            '$childName was marked late for Mathematics class on January 25th.',
        'date': 'Jan 25',
        'time': '10:15 AM',
        'isRead': true,
      },
      {
        'id': '6',
        'type': 'announcement',
        'title': 'Holiday Notice',
        'message': 'Campus will be closed on February 1st for maintenance.',
        'date': 'Jan 24',
        'time': '3:30 PM',
        'isRead': true,
      },
    ];

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
                      bottom: 24,
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
                          const SizedBox(height: 16),
                          Text(
                            'Notifications',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Stay updated with alerts and announcements',
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
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final n = notifications[index];
                        final isRead = n['isRead'] as bool;
                        final type = n['type'] as String;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _NotificationCard(
                            type: type,
                            title: n['title'] as String,
                            message: n['message'] as String,
                            date: n['date'] as String,
                            time: n['time'] as String,
                            isRead: isRead,
                          ),
                        );
                      },
                      childCount: notifications.length,
                    ),
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

class _NotificationCard extends StatelessWidget {
  final String type;
  final String title;
  final String message;
  final String date;
  final String time;
  final bool isRead;

  const _NotificationCard({
    required this.type,
    required this.title,
    required this.message,
    required this.date,
    required this.time,
    required this.isRead,
  });

  IconData _getIcon() {
    switch (type) {
      case 'alert':
        return Icons.warning_amber_rounded;
      case 'info':
        return Icons.info_outline;
      case 'announcement':
        return Icons.campaign_rounded;
      case 'success':
        return Icons.check_circle_outline;
      default:
        return Icons.notifications;
    }
  }

  Color _getIconColor() {
    switch (type) {
      case 'alert':
        return const Color(0xFFEF4444);
      case 'info':
        return const Color(0xFF3B82F6);
      case 'announcement':
        return const Color(0xFF8B5CF6);
      case 'success':
        return const Color(0xFF22C55E);
      default:
        return const Color(0xFF6B7280);
    }
  }

  Color _getIconBgColor() {
    switch (type) {
      case 'alert':
        return const Color(0xFFFEE2E2);
      case 'info':
        return const Color(0xFFDBEAFE);
      case 'announcement':
        return const Color(0xFFEDE9FE);
      case 'success':
        return const Color(0xFFDCFCE7);
      default:
        return const Color(0xFFF3F4F6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isRead ? Colors.white : const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(14),
        border: isRead
            ? Border.all(color: Colors.transparent)
            : const Border(
                left: BorderSide(color: Color(0xFF3B82F6), width: 4),
              ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getIconBgColor(),
              ),
              child: Icon(_getIcon(), color: _getIconColor(), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: const Color(0xFF111827),
                          ),
                        ),
                      ),
                      if (!isRead)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'New',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: const Color(0xFF6B7280),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        date,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '•',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        time,
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
          ],
        ),
      ),
    );
  }
}