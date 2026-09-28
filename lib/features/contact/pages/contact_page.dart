import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/url_launcher_service.dart';
import '../../../shared/widgets/section_header.dart';
import '../widgets/contact_tile.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _sendDirectMessage() {
    if (_formKey.currentState?.validate() ?? false) {
      final body =
          'Sender Email: ${_emailController.text}\n\nMessage:\n${_messageController.text}';
      UrlLauncherService.openEmail(
        AppStrings.email,
        subject: 'Portfolio Inquiry from Recruiter',
        body: body,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Opening email app to send your message...'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: 'Get In Touch',
              subtitle:
                  'Direct communication channels for recruitment & inquiries',
            ),
            const SizedBox(height: 8),

            // Direct Contact Options
            ContactTile(
              title: 'Email Address',
              subtitle: AppStrings.email,
              icon: Icons.email_rounded,
              color: Colors.red.shade600,
              onTap: () => UrlLauncherService.openEmail(AppStrings.email),
            ),
            ContactTile(
              title: 'Phone Number',
              subtitle: AppStrings.phone,
              icon: Icons.phone_rounded,
              color: Colors.green.shade600,
              onTap: () => UrlLauncherService.openPhone(AppStrings.phone),
            ),
            ContactTile(
              title: 'WhatsApp Instant Chat',
              subtitle: 'Connect directly on WhatsApp',
              icon: Icons.chat_rounded,
              color: Colors.teal.shade600,
              onTap: () => UrlLauncherService.openWhatsApp(AppStrings.whatsapp),
            ),
            ContactTile(
              title: 'GitHub Profile',
              subtitle: AppStrings.github,
              icon: Icons.code_rounded,
              color: theme.colorScheme.onSurface,
              onTap: () =>
                  UrlLauncherService.launchUrlString(AppStrings.github),
            ),
            ContactTile(
              title: 'LinkedIn Network',
              subtitle: AppStrings.linkedin,
              icon: Icons.work_rounded,
              color: Colors.blue.shade700,
              onTap: () =>
                  UrlLauncherService.launchUrlString(AppStrings.linkedin),
            ),

            const SizedBox(height: 24),
            const SectionHeader(
              title: 'Send Quick Message',
              subtitle: 'Compose an email directly to Suhaila Parvin',
            ),
            const SizedBox(height: 8),

            // Quick Message Card Form
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Your Email / Contact',
                          hintText: 'recruiter@company.com',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _messageController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Message / Opportunity Details',
                          hintText:
                              'Hi Suhaila, we would like to discuss a Flutter Developer position...',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Please enter a message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _sendDirectMessage,
                          icon: const Icon(Icons.send_rounded),
                          label: const Text('Send Message via Email'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
