import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Card(
          elevation: 0.0,
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(theme),
                _buildSubheader(theme),
                const SizedBox(height: 24),

                // Tech Skills Section
                _buildSectionTitle(theme, "Technical Skills"),
                const SizedBox(height: 16),
                _buildTechSkills(theme),
                const SizedBox(height: 32),

                // Soft Skills Section
                _buildSectionTitle(theme, "Soft Skills"),
                const SizedBox(height: 16),
                _buildSoftSkills(theme),
                const SizedBox(height: 24),

                // Developer Philosophy
                _buildPhilosophy(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) => Text(
        "Skills",
        style: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  Widget _buildSubheader(ThemeData theme) => Text(
        "My technical and soft skills",
        style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
      );

  Widget _buildSectionTitle(ThemeData theme, String title) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        child: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget _buildTechSkills(ThemeData theme) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildTechSkillCard(
          theme,
          "UI/UX",
          Logos.figma,
          "Passionate about creating intuitive and beautiful user interfaces",
          Colors.purple.shade400,
          90,
        ),
        _buildTechSkillCard(
          theme,
          "Flutter",
          Logos.flutter,
          "Expert in building cross-platform mobile applications with Flutter",
          Colors.blue.shade400,
          95,
        ),
        _buildTechSkillCard(
          theme,
          "Ionic",
          Logos.ionic,
          "Experienced in developing hybrid mobile apps with Ionic framework",
          Colors.blue.shade300,
          80,
        ),
        _buildTechSkillCard(
          theme,
          "PHP",
          Logos.php,
          "Backend development with PHP for web applications",
          Colors.indigo.shade400,
          75,
        ),
        _buildTechSkillCard(
          theme,
          "Express",
          Logos.express,
          iconColor: Colors.white,
          "Node.js framework for building RESTful APIs and web applications",
          Colors.green.shade400,
          80,
        ),
        _buildTechSkillCard(
          theme,
          "Python",
          Logos.python,
          "Automation scripts and data processing with Python",
          Colors.amber.shade600,
          85,
        ),
      ],
    );
  }

  Widget _buildTechSkillCard(ThemeData theme, String title, String iconData, String description, Color accentColor, int proficiency,
      {Color? iconColor}) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background progress indicator
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 300 * proficiency / 100,
                color: accentColor.withOpacity(0.1),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Iconify(iconData, color: iconColor),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "$proficiency%",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: proficiency / 100,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      color: accentColor,
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSoftSkills(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          _buildSoftSkillRadar(
            theme,
            "Teamwork",
            Icons.groups,
            Colors.green.shade400,
            90,
          ),
          _buildSoftSkillRadar(
            theme,
            "Business Understanding",
            LucideIcons.briefcase,
            Colors.blue.shade400,
            85,
          ),
          _buildSoftSkillRadar(
            theme,
            "Problem Solving",
            LucideIcons.lightbulb,
            Colors.amber.shade600,
            95,
          ),
          _buildSoftSkillRadar(
            theme,
            "Creativity",
            LucideIcons.palette,
            Colors.purple.shade400,
            80,
          ),
        ],
      ),
    );
  }

  Widget _buildSoftSkillRadar(
    ThemeData theme,
    String title,
    IconData iconData,
    Color color,
    int value,
  ) {
    final double progress = value / 100;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Background circles

            // Progress circle
            CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.transparent,
              color: color,
              strokeWidth: 8,
            ),

            // Center icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(iconData, color: color, size: 28),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "$value%",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPhilosophy(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  LucideIcons.code,
                  color: Colors.blue.shade300,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "My Developer Philosophy",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Commitment and passion for mobile development are the foundations of my work. I firmly believe that understanding system requirements and improving user experience adds significant value to any project. This combination is the key to building successful software. I continuously stay updated with best practices and emerging technologies to deliver innovative and efficient solutions that exceed expectations.",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade300,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            direction: Axis.horizontal,
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              _buildPhilosophyPoint(
                theme,
                LucideIcons.bookOpen,
                "Continual Learning",
                Colors.teal.shade400,
              ),
              const SizedBox(width: 24),
              _buildPhilosophyPoint(
                theme,
                LucideIcons.rocket,
                "Innovation",
                Colors.pink.shade400,
              ),
              const SizedBox(width: 24),
              _buildPhilosophyPoint(
                theme,
                LucideIcons.check,
                "Quality",
                Colors.green.shade400,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhilosophyPoint(
    ThemeData theme,
    IconData icon,
    String text,
    Color color,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
