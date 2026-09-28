import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/widgets/empty_view.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../../shared/widgets/section_header.dart';
import '../bloc/projects_bloc.dart';
import '../bloc/projects_event.dart';
import '../bloc/projects_state.dart';
import '../widgets/project_card.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  bool _showFeaturedOnly = false;

  @override
  void initState() {
    super.initState();
    // Dispatch LoadProjects on page initialization if not already loaded
    final bloc = context.read<ProjectsBloc>();
    if (bloc.state is ProjectsInitial) {
      bloc.add(const LoadProjects());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: 'Projects Portfolio',
              subtitle: 'Real-world cross-platform mobile applications',
              trailing: FilterChip(
                selected: _showFeaturedOnly,
                label: const Text('Featured Only'),
                onSelected: (val) {
                  setState(() => _showFeaturedOnly = val);
                },
                avatar: Icon(
                  _showFeaturedOnly
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  size: 16,
                  color: _showFeaturedOnly
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 12),

            BlocBuilder<ProjectsBloc, ProjectsState>(
              builder: (context, state) {
                if (state is ProjectsLoading || state is ProjectsInitial) {
                  return const SizedBox(
                    height: 300,
                    child: LoadingIndicator(
                      message: 'Loading projects database...',
                    ),
                  );
                }

                if (state is ProjectsError) {
                  return ErrorView(
                    message: state.message,
                    onRetry: () {
                      context.read<ProjectsBloc>().add(const LoadProjects());
                    },
                  );
                }

                if (state is ProjectsEmpty) {
                  return EmptyView(
                    title: 'No Projects Found',
                    description:
                        'No project records are available in local storage.',
                    onAction: () {
                      context.read<ProjectsBloc>().add(const LoadProjects());
                    },
                    actionLabel: 'Reload Projects',
                  );
                }

                if (state is ProjectsLoaded) {
                  final filteredList = _showFeaturedOnly
                      ? state.projects.where((p) => p.isFeatured).toList()
                      : state.projects;

                  if (filteredList.isEmpty) {
                    return EmptyView(
                      title: 'No Featured Projects',
                      description: 'Toggle filter off to view all projects.',
                      onAction: () {
                        setState(() => _showFeaturedOnly = false);
                      },
                      actionLabel: 'Show All Projects',
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final project = filteredList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ProjectCard(project: project),
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
