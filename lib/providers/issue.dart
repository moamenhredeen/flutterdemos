

import 'dart:async';

import 'package:demos/data/issue.dart';
import 'package:demos/data/issue_status.dart';
import 'package:demos/providers/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// providers
final issueProvider = FutureProvider.autoDispose<List<Issue>>((ref) async {
  return ref.read(issueRepositoryProvider).getIssues();
});

final filteredIssueProvider = FutureProvider.autoDispose.family<List<Issue>, Set<IssueStatus>>((ref, params) async {
  print(params);
  return ref.read(issueRepositoryProvider).filter(status: params);
});