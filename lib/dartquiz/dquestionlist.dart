import 'package:untitled/dartquiz/dquestclass.dart';
import 'package:flutter/material.dart';

List dquest = [
  dquestclass(
    dquest: 'What is Dart primarily used for?',
    dans: [
      'Building mobile, web, and desktop applications',
      'Operating system development',
      'Game development engines',
      'Database management',
    ],
  ),
  dquestclass(
    dquest: 'Which keyword is used to define a constant variable in Dart?',
    dans: [' const', 'fixed', 'finalized', 'permanent'],
  ),
  dquestclass(
    dquest:
        ' What is the default return type of a Dart function if nothing is returned?',
    dans: ['void', 'null', 'dynamic', 'int'],
  ),
  dquestclass(
    dquest: 'Which of the following is the entry point of a Dart application?',
    dans: ['main()', 'start()', 'run()', 'init()'],
  ),
  dquestclass(
    dquest: ' What does the final keyword mean in Dart?',
    dans: [
      'Variable can be set only once',
      'Variable is constant at compile-time',
      'Variable can never be null',
      'Variable is read-only at runtime',
    ],
  ),
  dquestclass(
    dquest: 'How do you create a list in Dart?',
    dans: [
      'var list = [1, 2, 3];',
      'list = new Array(1, 2, 3);',
      'list = createList(1,2,3);',
      'List list = 1,2,3;',
    ],
  ),
  dquestclass(
    dquest: 'Which operator is used for null-aware assignment?',
    dans: ['??=', '?=', ':=', '!=='],
  ),
  dquestclass(
    dquest:
        'What is the correct way to define an asynchronous function in Dart?',
    dans: [
      'Future<void> myFunc() async {}',
      'async Future<void> myFunc() {}',
      'async function myFunc()',
      'function async myFunc()',
    ],
  ),
  dquestclass(
    dquest: 'What does the await keyword do?',
    dans: [
      'Waits for a Future to complete',
      'Delays code execution by a second',
      ' Marks a function as asynchronous',
      'Suspends all threads',
    ],
  ),
  dquestclass(dquest: 'Which of the following types is used for values that can hold any data type?',
      dans: ['dynamic', 'Object', 'Any', 'varType']),
];
