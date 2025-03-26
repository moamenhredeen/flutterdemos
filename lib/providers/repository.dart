

import 'package:demos/data/issue_repository.dart';
import 'package:demos/data/issue_repository_contract.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final issueRepositoryProvider = Provider<IssueRepositoryContract>((ref) => IssueRepository());