import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenjoy/features/record/create/RecordCreateProvider.dart';

class RecordCreatePage extends ConsumerWidget{
  const RecordCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final state = ref.watch(recordCreateProvider);
    final notifier = ref.read(recordCreateProvider.notifier);
  }
}

