// import 'package:flutter/material.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';
// import 'package:provider/provider.dart';
// import 'dart:html' as html;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/services.dart' show rootBundle;

// // Provider for managing resume state
// class ResumeProvider extends ChangeNotifier {
//   String _currentPdfUrl = 'assets/resume.pdf';
//   bool _isLoading = true;
//   bool _hasError = false;
//   String _errorMessage = '';

//   String get currentPdfUrl => _currentPdfUrl;
//   bool get isLoading => _isLoading;
//   bool get hasError => _hasError;
//   String get errorMessage => _errorMessage;

//   // Check if the PDF asset exists
//   Future<void> checkPdfExists() async {
//     try {
//       _isLoading = true;
//       notifyListeners();

//       // Try to load the PDF data
//       await rootBundle.load(_currentPdfUrl);

//       _isLoading = false;
//       _hasError = false;
//       notifyListeners();
//     } catch (e) {
//       _isLoading = false;
//       _hasError = true;
//       _errorMessage = 'Error loading PDF: $e';
//       notifyListeners();
//       print('PDF Error: $e');
//     }
//   }

//   // Try a different PDF path
//   void tryAlternativePath(String path) {
//     _currentPdfUrl = path;
//     _isLoading = true;
//     _hasError = false;
//     notifyListeners();
//     checkPdfExists();
//   }
// }

// class ResumeSection extends StatefulWidget {
//   const ResumeSection({super.key});

//   @override
//   State<ResumeSection> createState() => _ResumeSectionState();
// }

// class _ResumeSectionState extends State<ResumeSection> {
//   final ResumeProvider _provider = ResumeProvider();

//   @override
//   void initState() {
//     super.initState();
//     // Check if PDF exists when widget initializes
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _provider.checkPdfExists();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);

//     return ChangeNotifierProvider.value(
//       value: _provider,
//       child: Consumer<ResumeProvider>(
//         builder: (context, resumeProvider, _) {
//           return Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Container(
//               constraints: const BoxConstraints(maxWidth: 1000),
//               child: Card(
//                 elevation: 0.0,
//                 color: Colors.black12,
//                 child: Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildHeader(theme),
//                       _buildSubheader(theme),
//                       const SizedBox(height: 24),
//                       // PDF viewer always shown
//                       // _buildPdfViewer(resumeProvider, theme),
//                       const SizedBox(height: 24),
//                       _buildActionButtons(context, theme, resumeProvider),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildHeader(ThemeData theme) => Text(
//         "Resume",
//         style: theme.textTheme.headlineMedium?.copyWith(
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       );

//   Widget _buildSubheader(ThemeData theme) => Text(
//         "Check out my professional experience and skills",
//         style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
//       );
//   Widget _buildActionButtons(BuildContext context, ThemeData theme, ResumeProvider provider) {
//     return Wrap(
//       spacing: 16,
//       runSpacing: 16,
//       alignment: WrapAlignment.center,
//       runAlignment: WrapAlignment.center,
//       crossAxisAlignment: WrapCrossAlignment.center,
//       direction: Axis.horizontal,
//       children: [
//         _buildActionCard(
//           theme: theme,
//           title: "Download PDF",
//           description: "Get a copy of my resume",
//           icon: LucideIcons.fileDown,
//           buttonLabel: "Download",
//           buttonIcon: LucideIcons.download,
//           buttonColor: Colors.greenAccent,
//           onPressed: () => _downloadPdf(provider.currentPdfUrl),
//         ),
//         // _buildActionCard(
//         //   theme: theme,
//         //   title: "Send via Email",
//         //   description: "Request my resume by email",
//         //   icon: LucideIcons.mailPlus,
//         //   buttonLabel: "Request",
//         //   buttonIcon: LucideIcons.send,
//         //   buttonColor: Colors.greenAccent,
//         //   onPressed: () => _sendEmailRequest(context),
//         // ),
//         // Debug button to try alternative paths
//         if (provider.hasError)
//           _buildActionCard(
//             theme: theme,
//             title: "Try Different Path",
//             description: "Attempt to load from another location",
//             icon: LucideIcons.refreshCw,
//             buttonLabel: "Try",
//             buttonIcon: LucideIcons.check,
//             buttonColor: Colors.orange,
//             onPressed: () {
//               // Try a few different common asset paths
//               if (provider.currentPdfUrl == 'assets/resume.pdf') {
//                 provider.tryAlternativePath('assets/pdfs/resume.pdf');
//               } else if (provider.currentPdfUrl == 'assets/pdfs/resume.pdf') {
//                 provider.tryAlternativePath('/assets/resume.pdf');
//               } else {
//                 provider.tryAlternativePath('resume.pdf');
//               }
//             },
//           ),
//       ],
//     );
//   }

//   Widget _buildActionCard({
//     required ThemeData theme,
//     required String title,
//     required String description,
//     required IconData icon,
//     required String buttonLabel,
//     required IconData buttonIcon,
//     required Color buttonColor,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       width: 300,
//       decoration: BoxDecoration(
//         color: Colors.black45,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
//       ),
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: buttonColor.withValues(alpha: 0.2),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 padding: const EdgeInsets.all(8),
//                 child: Icon(icon, color: buttonColor),
//               ),
//               const SizedBox(width: 12),
//               Text(
//                 title,
//                 style: theme.textTheme.titleMedium?.copyWith(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Text(
//             description,
//             style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           const SizedBox(height: 16),
//           Align(
//             alignment: Alignment.centerRight,
//             child: TextButton.icon(
//               onPressed: onPressed,
//               style: TextButton.styleFrom(
//                 backgroundColor: buttonColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               ),
//               icon: Icon(buttonIcon, color: Colors.black87, size: 18),
//               label: Text(
//                 buttonLabel,
//                 style: theme.textTheme.bodyMedium?.copyWith(
//                   color: Colors.black87,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _downloadPdf(String pdfPath) {
//     if (kIsWeb) {
//       // For web, create an anchor element to download the PDF
//       html.AnchorElement anchorElement = html.AnchorElement(href: pdfPath);
//       anchorElement.download = 'Anthony_Resume.pdf';
//       anchorElement.click();
//     }
//   }

//   void _sendEmailRequest(BuildContext context) {
//     if (kIsWeb) {
//       final Uri emailLaunchUri = Uri(
//         scheme: 'mailto',
//         path: 'elbolonxd@gmail.com',
//         query: _encodeQueryParameters(
//             {'subject': 'Resume Request', 'body': 'Hello, I would like to request a copy of your resume. Thank you!'}),
//       );
//       html.window.open(emailLaunchUri.toString(), '_blank');
//     }
//   }

//   String? _encodeQueryParameters(Map<String, String> params) {
//     return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
//   }
// }
